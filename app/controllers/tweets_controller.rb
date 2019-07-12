class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @user = User.find(params[:user_id])
    @retweet = @user.retweets.new
  end

  def create
    @user = User.find(params[:user_id])
    if :retweet
      @tweet = Tweet.find(params[:tweet_id])
      @retweet = @tweet.retweet.new(tweet_params)
      if @retweet.save
        redirect_to user_path(@user)
      else
        render :new
      end
    else
      @tweet = @user.tweets.new(tweet_params)
      if @tweet.save
        redirect_to user_path(@user)
      else
        render 'users/show'
      end
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
