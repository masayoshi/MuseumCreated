# -*- coding: utf-8 -*-
class LocationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /locations
  # GET /locations.json
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
      @json = Location.near(params[:search], 50, :order => :distance).to_gmaps4rails
    else
      @locations = Location.all
      @json = Location.all.to_gmaps4rails
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    @location = current_user.locations.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = current_user.locations.build(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: '活動場所が正常に登録されました。' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = current_user.locations.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: '活動場所が正常に更新されました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = current_user.locations.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to settings_locations_url }
      format.json { head :no_content }
    end
  end
end
