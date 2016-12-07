class UsersController < ApplicationController
  before_action :set_user, only: [:show, :favorites, :follows, :followers]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def favorites
    @users = User.all
  end

  def follows
  end

  def followers
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :image, :interest_list)
  end

end
