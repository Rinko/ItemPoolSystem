class KnowledgePointInfosController < ApplicationController
  before_filter :admin_authorize ,:only =>[:new,:edit,:create,:destory,:update]

  # GET /knowledge_point_infos
  # GET /knowledge_point_infos.json
  def index
    @knowledge_point_infos = KnowledgePointInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @knowledge_point_infos }
    end
  end

  # GET /knowledge_point_infos/1
  # GET /knowledge_point_infos/1.json
  def show
    @knowledge_point_info = KnowledgePointInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @knowledge_point_info }
    end
  end

  # GET /knowledge_point_infos/new
  # GET /knowledge_point_infos/new.json
  def new
    @knowledge_point_info = KnowledgePointInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @knowledge_point_info }
    end
  end

  # GET /knowledge_point_infos/1/edit
  def edit
    @knowledge_point_info = KnowledgePointInfo.find(params[:id])
  end

  # POST /knowledge_point_infos
  # POST /knowledge_point_infos.json
  def create
    @knowledge_point_info = KnowledgePointInfo.new(params[:knowledge_point_info])

    respond_to do |format|
      if @knowledge_point_info.save
        format.html { redirect_to @knowledge_point_info, :notice => 'Knowledge point info was successfully created.' }
        format.json { render :json => @knowledge_point_info, :status => :created, :location => @knowledge_point_info }
      else
        format.html { render :action => "new" }
        format.json { render :json => @knowledge_point_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knowledge_point_infos/1
  # PUT /knowledge_point_infos/1.json
  def update
    @knowledge_point_info = KnowledgePointInfo.find(params[:id])

    respond_to do |format|
      if @knowledge_point_info.update_attributes(params[:knowledge_point_info])
        format.html { redirect_to @knowledge_point_info, :notice => 'Knowledge point info was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @knowledge_point_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_point_infos/1
  # DELETE /knowledge_point_infos/1.json
  def destroy
    @knowledge_point_info = KnowledgePointInfo.find(params[:id])
    @knowledge_point_info.destroy

    respond_to do |format|
      format.html { redirect_to knowledge_point_infos_url }
      format.json { head :ok }
    end
  end
end
