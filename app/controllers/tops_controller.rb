class TopsController < ApplicationController
  before_action :check_user
  def index
  end

  private
  def check_user
    redirect_to articles_path if current_user
  end

end
