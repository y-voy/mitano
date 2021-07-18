class ImpressionsController < ApplicationController

  def index
    @articles = Article.all.includes([:likes, :stocks]).order(impressions_count: 'DESC').first(10)
  end

end
