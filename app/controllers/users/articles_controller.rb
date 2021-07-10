class Users::ArticlesController < ApplicationController
  before_action :set_user

  def index
    @articles = @user.articles
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
