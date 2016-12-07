class TrendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users  = User.all
    @tweet  = Tweet.new
    @tweets = Tweet.order(id: :desc).all
    @trends = ActsAsTaggableOn::Tag.most_used(10)
  end

end
