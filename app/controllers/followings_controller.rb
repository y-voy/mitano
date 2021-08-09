class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    users = Following.where(follower_id: current_user.id).pluck(:followed_id)
    @users = User.find(users)
  end

  respond_to? :js
  def create
    # @user = User.find(params[:following][:followed_id])
    current_user.follow!(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # @user = Following.find(params[:id]).followed
    current_user.unfollow!(params[:user_id])
    redirect_back(fallback_location: root_path)
  end
end
