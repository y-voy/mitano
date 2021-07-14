class Tags::ArticlesController < ApplicationController
  before_action :set_tag

  def index
    @articles = @tag.articles
  end

  private
  def set_tag
    @tag = Tag.find(params[:tag_id])
  end
end
