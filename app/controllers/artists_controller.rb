# -*- coding: utf-8 -*-
class ArtistsController < ApplicationController
  def index
    @artists = User.refine_search(params).page(params[:page])
    @interests = User.refine_search(params).interest_counts
    @skills = User.refine_search(params).skill_counts
    @areas =  User.refine_search(params).area_counts
    @free_words =  User.refine_search(params).free_word_counts
  end

  def show
    @artist = User.find_by_username(params[:username])
    @works = @artist.works.limit(5)
    if @artist.nil?
      redirect_to artists_path, :alert => "ご指定のアーティストは見つかりませんでした"
    end
  end

end
