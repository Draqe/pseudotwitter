class TweetsController < ApplicationController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.new
    @reply.type = params[:type]
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to user_path(current_user)
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
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to user_path(@user)
  end


  private

  def set_type
    case params[:type]
    when 'Reply'
      'reply'
    else
      'tweet'
    end
  end

  def tweet_params
    params.require(set_type.to_sym).permit(:type, :text, :tweet_id, :user_id)
  end
end
