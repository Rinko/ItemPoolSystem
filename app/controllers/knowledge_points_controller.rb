class KnowledgePointsController < ApplicationController
  #new 和 edit 有时间的话使用拖拽，暂时维持这样
  # GET /knowledge_points
  # GET /knowledge_points.json
  def index
    @knowledge_points = KnowledgePoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @knowledge_points }
    end
  end

  # GET /knowledge_points/1
  # GET /knowledge_points/1.json
  def show
    @knowledge_point = KnowledgePoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @knowledge_point }
    end
  end

  # GET /knowledge_points/new
  # GET /knowledge_points/new.json
  def new
    @books = Book.all
    @knowledge_point = KnowledgePoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @knowledge_point }
    end
  end

  # GET /knowledge_points/1/edit
  def edit
    @books = Book.all
    @knowledge_point = KnowledgePoint.find(params[:id])
  end

  # POST /knowledge_points
  # POST /knowledge_points.json
  def create
    @knowledge_point = KnowledgePoint.new(params[:knowledge_point])
    params[:structure_ids].each do |structure_id|
      @structure = Structure.find_by_id(structure_id)
      @knowledge_point.structures << @structure
    end
    respond_to do |format|
      if @knowledge_point.save
        format.html { redirect_to @knowledge_point, :notice => 'Knowledge point was successfully created.' }
        format.json { render :json => @knowledge_point, :status => :created, :location => @knowledge_point }
      else
        format.html { render :action => "new" }
        format.json { render :json => @knowledge_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knowledge_points/1
  # PUT /knowledge_points/1.json
  def update
    @knowledge_point = KnowledgePoint.find(params[:id])

    respond_to do |format|
      if @knowledge_point.update_attributes(params[:knowledge_point])
        format.html { redirect_to @knowledge_point, :notice => 'Knowledge point was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @knowledge_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_points/1
  # DELETE /knowledge_points/1.json
  def destroy
    @knowledge_point = KnowledgePoint.find(params[:id])
    @knowledge_point.destroy

    respond_to do |format|
      format.html { redirect_to knowledge_points_url }
      format.json { head :ok }
    end
  end
end
