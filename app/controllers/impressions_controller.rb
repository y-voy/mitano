class ImpressionsController < ApplicationController

  def index
    @articles = Kaminari.paginate_array(Article.all.includes([:likes, :stocks]).order(impressions_count: 'DESC')).page(params[:page]).per(10)
  end

end
