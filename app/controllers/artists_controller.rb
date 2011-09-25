# -*- coding: utf-8 -*-
class ArtistsController < ApplicationController
  def index
    @artists = User.order(:created_at).page(params[:page])
  end

  def show
    @artist = User.find_by_username(params[:username])
    if @artist.nil?
      redirect_to artists_path, :alert => "ご指定のアーティストは見つかりませんでした"
    end
  end

end
