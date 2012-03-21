class AnsweredQuestionInfosController < ApplicationController
  before_filter :admin_authorize ,:only =>[:new,:edit,:create,:destory,:update]
  # GET /answered_question_infos
  # GET /answered_question_infos.json
  def index
    @answered_question_infos = AnsweredQuestionInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @answered_question_infos }
    end
  end

  # GET /answered_question_infos/1
  # GET /answered_question_infos/1.json
  def show
    @answered_question_info = AnsweredQuestionInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @answered_question_info }
    end
  end

  # GET /answered_question_infos/new
  # GET /answered_question_infos/new.json
  def new
    @answered_question_info = AnsweredQuestionInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @answered_question_info }
    end
  end

  # GET /answered_question_infos/1/edit
  def edit
    @answered_question_info = AnsweredQuestionInfo.find(params[:id])
  end

  # POST /answered_question_infos
  # POST /answered_question_infos.json
  def create
    @answered_question_info = AnsweredQuestionInfo.new(params[:answered_question_info])

    respond_to do |format|
      if @answered_question_info.save
        format.html { redirect_to @answered_question_info, :notice => 'Answered question info was successfully created.' }
        format.json { render :json => @answered_question_info, :status => :created, :location => @answered_question_info }
      else
        format.html { render :action => "new" }
        format.json { render :json => @answered_question_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answered_question_infos/1
  # PUT /answered_question_infos/1.json
  def update
    @answered_question_info = AnsweredQuestionInfo.find(params[:id])

    respond_to do |format|
      if @answered_question_info.update_attributes(params[:answered_question_info])
        format.html { redirect_to @answered_question_info, :notice => 'Answered question info was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @answered_question_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answered_question_infos/1
  # DELETE /answered_question_infos/1.json
  def destroy
    @answered_question_info = AnsweredQuestionInfo.find(params[:id])
    @answered_question_info.destroy

    respond_to do |format|
      format.html { redirect_to answered_question_infos_url }
      format.json { head :ok }
    end
  end

  def student_history
    stu = Student.find_by_id session[:user_id]
    @answered_question_infos = stu.answered_question_infos
    respond_to do |format|
      format.html
    end
  end
end
