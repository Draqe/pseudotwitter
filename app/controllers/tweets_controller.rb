class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.find(params[:user_id])
    @retweet = @user.retweets.new
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = @user.send(set_type.pluralize).new(tweet_params)
    if @tweet.save
      redirect_to user_path(@user)
    else
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

  def set_type
    case params[:type]
    when 'Retweet'
      'retweet'
    else
      'tweet'
    end
  end

  def tweet_params
    params.require(set_type.to_sym).permit(:type, :text)
  end
end
