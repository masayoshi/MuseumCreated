# -*- coding: utf-8 -*-
class WorksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /works
  # GET /works.json
  def index
    @works = Work.refine_search(params).page(params[:page])
    @tags = Work.refine_search(params).tag_counts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @works }
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = current_user.works.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = current_user.works.find(params[:id])
  end

  # POST /works
  # POST /works.json
  def create
    @work = current_user.works.build(params[:work])

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: '作品は正常に登録されました。' }
        format.json { render json: @work, status: :created, location: @work }
      else
        format.html { render action: "new" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = current_user.works.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to @work, notice: '作品は正常に更新されました。' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = current_user.works.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to artist_works_path(username: current_user.username), notice: '正常に削除されました。' }
      format.json { head :ok }
    end
  end
end
