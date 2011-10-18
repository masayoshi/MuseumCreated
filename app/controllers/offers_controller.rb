# -*- coding: utf-8 -*-
class OffersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @offers = current_user.offers.status_in(params[:status]).page(params[:page])
  end

  def check
    @offers = current_user.offerings.status_in(params[:status]).page(params[:page])
  end
  
  def show
    unless @offer = Offer.find_by_id(params[:id])
      redirect_to root_path, alert: 'オファーが存在しません'
    end
  end

  def new
    if @artist = User.find_by_id(params[:artist_id].to_i)
      @offer = @artist.offers.new
    elsif
      redirect_to root_path, alert: 'オファーしようとしたアーティストが存在しません'
    end
  end

  # POST /offers
  def create
    @offer = current_user.offerings.build(params[:offer])
    
    if @offer.save
      redirect_to "/artists/#{@offer.offered_user.username}", notice: '正常にオファーされました'
    else
      render :action => "new"
    end
  end

  # DELETE /offers/1
  def destroy
    @offer = Offer.offered_by(current_user.profile.id).find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to(offers_url) }
      format.xml  { head :ok }
    end
  end

  def accept
    @offer = current_user.offers.find_by_id(params[:id])
    @offer.accept!
    redirect_to offer_path(@offer.id), :notice => 'オファーを受諾しました'
  end

  def reject
    @offer = current_user.offers.find_by_id(params[:id])
    @offer.reject!
    redirect_to offer_path(@offer.id), :alert => 'オファーを拒否しました'
  end
end
