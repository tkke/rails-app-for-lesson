class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users  = User.all
    @tweets = Favorite.order(id: :desc).page(params[:page])
    @tweet  = Tweet.new

    @total_fav = 0
    @num_fav   = 0
    @your_fav  = 0
    @tweets.each do |tweet|
      @users.each do |u|
        if Tweet.find(tweet.tweet_id).favorited_by? u
          @num_fav += 1
        end
        if u == current_user
          @your_fav += 1
        end
      end
      @total_fav += @num_fav
    end
  end

end
