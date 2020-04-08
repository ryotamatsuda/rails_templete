class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_tweets = Tweet.all
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def create
    new_tweet = current_user.tweets.new(tweet_params)
    new_tweet.save
    redirect_to tweet_path(new_tweet.id)
  end
  def destroy
  end
  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
