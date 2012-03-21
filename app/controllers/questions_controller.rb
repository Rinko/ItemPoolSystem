class QuestionsController < ApplicationController
  before_filter :admin_authorize ,:only =>[:new,:edit,:create,:destory,:update]
  BOOK_WEIGHT = 5
  UNIT_WEIGHT = 3
  CHAPTER_WEIGHT = 1
  PROGRESS_WEIGHT = 3
  KNOWLEDGE_POINT_LEVEL_WEIGHT = 5
  class Node
    attr_accessor :key,:sub_nodes
    def initialize(key)
      @key = key
      @sub_nodes = []
    end
  end
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @knowledge_points = KnowledgePoint.all
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @knowledge_points = KnowledgePoint.find(:all) 
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    params[:knowledge_point_ids].each do |knowledge_point_id|
      @knowledge_point = KnowledgePoint.find_by_id(knowledge_point_id)
      @question.knowledge_points << @knowledge_point
    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, :notice => 'Question was successfully created.' }
        format.json { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, :notice => 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end

  def query_by_student
    @difficulty_hash = {}
    @questions = []
#    @student = Student.find(params[:student_id])
    @student = Student.find(session[:user_id])
    @student.lack_knowledge_points.each do |lack_knowledge_point|
     lack_knowledge_point.questions.each do |question|
       difficulty = difficulty_judge(@student,question)
       @difficulty_hash[question.id] = difficulty
       if difficulty > params[:difficulty_min].to_i && difficulty < params[:difficulty_max].to_i
        @questions |= [question]
       end
     end
    end
    respond_to do |format|
      format.html 
    end
  end

  def post_by_student
    @student = Student.find(params[:id])
    @answered_question_infos = []
    @questions = []
    params[:answers].each_key do |key| 
      @questions << Question.find(key.to_i) 
      @answered_question_infos << AnsweredQuestionInfo.find_by_question_id_and_student_id(key.to_i,@student.id)
    end
    @questions.each do |question|  
      if question.answer == params[:answers]["#{question.id}"]
        @student.answered_question_infos.create(:question_id => question.id,:right_or_wrong => true)
        question.knowledge_points.each do |knowledge_point|
          knowledge_point_info = @student.knowledge_point_infos.find_by_knowledge_point_id(knowledge_point.id)
          if knowledge_point_info.level < question.difficulty
            knowledge_point_info.level += (question.difficulty - knowledge_point_info.level)/2
            knowledge_point_info.save
          end
        end
      else
        @student.answered_question_infos.create(:question_id => question.id,:right_or_wrong => false,:wrong_answer =>params[:answers]["#{question.id}"])
        question.knowledge_points.each do |knowledge_point|
          knowledge_point_info = @student.knowledge_point_infos.find_by_knowledge_point_id(knowledge_point.id)
          if knowledge_point_info.level > question.difficulty
            knowledge_point_info.level -= (knowledge_point_info.level - question.difficulty)/2
            knowledge_point_info.save
          end
        end
      end
    end
#    index
    respond_to do |format|
      format.html {render :file => 'answered_question_infos/post_by_student'}
    end
  end
  
  def difficulty_judge(student,question)
    @difficulty = question.difficulty

#    取得学生关于此问题科目的学习进度
    @progress = Structure.query_progress_by(student.id,question)
#        @progresses.each do |progress|
#          if progress.book.subject == structure.book.subject
#            @progress = progress
#          end
#        end                                  取得学生关于此问题科目的学习进度  move to Structure model by SQL query

    @knowledge_point_infos = student.knowledge_point_infos
    @books = []

#    学生知识点掌握程度加成
    KnowledgePointInfo.query_knowledge_point_infos_by(student.id,question.id).each do |knowledge_point_info|
        @difficulty += (5 - knowledge_point_info.level) * KNOWLEDGE_POINT_LEVEL_WEIGHT
      end

#      将问题的知识点所涉及的所有章节组成一棵树
    question.knowledge_points.each do |knowledge_point|
#      @knowledge_point_infos.each do |knowledge_point_info|
#        if knowledge_point_info.knowledge_point_id == knowledge_point.id
#          @difficulty += (5 - knowledge_point_info.level) * KNOWLEDGE_POINT_LEVEL_WEIGHT
#        end
#      end                                   学生知识点掌握程度加成    move to KnowledgePointInfo model by SQL query 
      knowledge_point.structures.each do |structure|
        @book = @books.find { |book| book.key == structure}
        if @book == nil
          @book = Node.new(structure)
          @books << @book
        end
        @unit = @book.sub_nodes.find { |unit| unit.key == structure }
        if @unit == nil
          @unit = Node.new(structure)
          @book.sub_nodes << @unit
        end
        @unit.sub_nodes << structure

#        考虑该章节不属于学生当前在学时有遗忘 以及属于正在学的单元未完全掌握 给予学生学习进度加成
        if @progress.book_id == structure.book_id
          if @progress.unit == structure.unit
             @difficulty += PROGRESS_WEIGHT
          end
        else
          @difficulty += PROGRESS_WEIGHT
        end
      end
    end
#    题目涉及到的章节的复杂程度（树结构） + 重要程度（有关章节权重）
    @difficulty += @books.length * BOOK_WEIGHT
    @books.each do |book|
      @difficulty += book.key.weight
      units = book.sub_nodes
      @difficulty += units.length * UNIT_WEIGHT
      units.each do |unit|
        @difficulty += unit.key.weight
        chapters = unit.sub_nodes
        @difficulty += chapters.length * CHAPTER_WEIGHT
        chapters.each { |chapter| @difficulty += chapter.weight }
      end
    end
    return @difficulty
  end

  def view_by_student
    @books = Book.all
    respond_to do |format|
      format.html  
    end
  end
  def remote_query_by_knowledge_point
    @questions = KnowledgePoint.find_by_id(params[:knowledge_point_id]).questions
    respond_to do |format|
      format.js  
    end
  end
end
