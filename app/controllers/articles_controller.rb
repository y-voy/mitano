class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def confirm
    @article = Article.new(article_params)
    render :new if @article.invalid?
  end

  def create
    @article = Article.new(article_params)
    if params[:back]
      render :new
    else
      if @article.save
        redirect_to articles_path, notice: t("notice.article_create")
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: t("notice.article_update")
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: t("notice.article_destroy")
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
