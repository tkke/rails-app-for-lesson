class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.order(id: :desc).page(params[:page])
    @tweet  = Tweet.new
    @users  = User.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body, :user_id, :image, :interest_list)
    end
end
