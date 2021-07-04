class StocksController < ApplicationController

  def index
    stocks = Stock.where(user_id: current_user.id).pluck(:article_id)
    @articles = Article.find(stocks)
  end

  def create
    stock = current_user.stocks.create(article_id: params[:article_id])
    redirect_to articles_url, notice: "#{stock.article.user.name}さんの投稿をストックしました"
  end

  def destroy
    stock = current_user.stocks.find_by(id: params[:id]).destroy
    redirect_to articles_url, notice: "#{stock.article.user.name}さんの投稿のストックを解除しました"
  end

end
