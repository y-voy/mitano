class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    users = Following.where(follower_id: current_user.id).pluck(:followed_id)
    @users = User.find(users)
  end

  respond_to? :js
  def create
    @user = User.find(params[:following][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Following.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
