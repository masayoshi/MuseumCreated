class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    if params[:search_word].present?
      @keyword = params[:search_word]
      @articles = Article.search(@keyword).paginate(page: params[:page])
    else
      @articles = Article.paginate(page: params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
end
