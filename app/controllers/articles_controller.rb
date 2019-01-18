class ArticlesController < ApplicationController

  # Basic Authenticaation
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    # display articles in order
    @articles = Article.order("title").page(params[:page]).per(10)
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.friendly.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
      # reuse article_params instead of specifically
      # identifying which column and value is to be updated
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
