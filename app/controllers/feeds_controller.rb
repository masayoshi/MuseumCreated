# -*- coding: utf-8 -*-
class FeedsController < ApplicationController
  before_filter :authenticate_user!

  # GET /feeds
  def index
    @feeds = current_user.feeds.all
    @feed = current_user.feeds.new
  end

  # POST /feeds
  def create
    @feed = current_user.feeds.build(params[:feed])
    @feeds = current_user.feeds.all

    if @feed.save
      redirect_to feeds_url, notice: 'RSSフィードは正常に登録されました。'
    else
      render action: "index"
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed = current_user.feeds.find(params[:id])
    @feed.destroy
    @feeds = current_user.feeds.all
    redirect_to feeds_url, notice: '正常に削除されました。'
  end
end
