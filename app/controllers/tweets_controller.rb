class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.create(tweet_params)
    redirect_to user_path(@user)
  end

  def edit
    @tweets = Tweet.all
    @tweet = Tweet.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to user_path(@user)
  end
    
  private
    def tweet_params
      params.require(:tweet).permit(:text)
    end
end
