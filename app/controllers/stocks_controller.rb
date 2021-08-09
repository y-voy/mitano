class StocksController < ApplicationController

  def index
    stocks = Stock.where(user_id: current_user.id).pluck(:article_id)
    @articles = Article.find(stocks)
  end

  def create
    stock = current_user.stocks.create(article_id: params[:article_id])
    flash[:notice] = "#{stock.article.user.name}さんの投稿をストックしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    stock = current_user.stocks.find_by(id: params[:id]).destroy
    flash[:notice] = "#{stock.article.user.name}さんの投稿のストックを解除しました"
    redirect_back(fallback_location: root_path)
  end

end
