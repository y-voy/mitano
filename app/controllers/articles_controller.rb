class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :confirm, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def confirm
    @article = current_user.articles.build(article_params)
    render :new if @article.invalid?
  end

  def create
    @article = current_user.articles.build(article_params)
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
    @like = current_user.likes.find_by(article_id: @article.id) if user_signed_in?
    @stock = current_user.stocks.find_by(article_id: @article.id) if user_signed_in?
    @comment = Comment.new
    @comments = @article.comments.order(created_at: :desc)
  end

  def edit
    unless @article.user_id == current_user.id
      redirect_to articles_path
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to articles_path, notice: t("notice.article_destroy")
    else
      redirect_to articles_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
