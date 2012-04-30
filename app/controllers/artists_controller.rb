# -*- coding: utf-8 -*-
class ArtistsController < ApplicationController
  def index
    @artists = User.refine_search(params).order('created_at DESC').page(params[:page])
    @interests = User.refine_search(params).interest_counts
    @skills = User.refine_search(params).skill_counts
    @areas =  User.refine_search(params).area_counts
    @free_words =  User.refine_search(params).free_word_counts
  end

  def show
    @artist = User.confirmed.find_by_username(params[:username])
    if @artist.nil?
      redirect_to artists_path, :alert => "ご指定のアーティストは見つかりませんでした"
    else
      @works = @artist.works.order('created_at DESC').limit(5)
      @events = @artist.events.order('start_time DESC').limit(3)
      @json = @artist.locations.to_gmaps4rails
    end
  end

end
