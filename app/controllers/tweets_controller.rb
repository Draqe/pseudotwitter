class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.create(tweet_params)
    redirect_to user_path(@user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to user_path(@user)
  end
    
  private
    def tweet_params
      params.require(:tweet).permit(:user, :text)
    end
end
