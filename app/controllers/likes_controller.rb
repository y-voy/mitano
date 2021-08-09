class LikesController < ApplicationController

  def index
    @articles = Article.joins(:likes).group(:id).order("count(*) desc")
  end

  def create
    like = current_user.likes.create(article_id: params[:article_id])
    flash[:notice] = "#{like.article.user.name}さんの投稿に「いいね」をしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    flash[:notice] = "#{like.article.user.name}さんの投稿の「いいね」を解除しました"
    redirect_back(fallback_location: root_path)
  end

end
