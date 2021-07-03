class LikesController < ApplicationController

  def create
    like = current_user.likes.create(article_id: params[:article_id])
    redirect_to articles_url, notice: "#{like.article.user.name}さんの投稿に「いいね」をしました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to articles_url, notice: "#{like.article.user.name}さんの投稿の「いいね」を解除しました"
  end

end
