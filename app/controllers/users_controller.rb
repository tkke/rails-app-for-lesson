class UsersController < ApplicationController
  before_action :set_user, only: [:show, :favorites]
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
  end

  def favorites
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
