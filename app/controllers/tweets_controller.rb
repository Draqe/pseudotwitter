class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = current_user
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.retweets.new
    @reply.type = params[:type]
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user
    if @tweet.save
      redirect_to user_path(current_user)
    else
      raise @tweet.errors.inspect
      render :new
    end
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

  def set_tweet
    @user = User.find(params[:user_id])
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:type, :text, :tweet_id, :user_id)
  end
end
