class TweetsController < ApplicationController

  before_action :authorize

  def new
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.tweet_id.present?
      @tweet.type = 'Reply'
    end
    respond_to do |format|
      if @tweet.save
        if @tweet.type == 'Reply'
          format.html { redirect_to new_tweet_reply_path(@tweet.tweet_id) }
          format.json { render json: @reply, status: :created, location: @tweet }
        else
          format.html { redirect_to user_path(current_user) }
          format.json { render json: @tweet, status: :created, location: @tweet }
        end
      else
        flash[:notice] = 'Tweet has errors!'
        if @tweet.type == 'Reply'
          redirect_to new_tweet_reply_path(@tweet.tweet_id)
        else
          redirect_to user_path(current_user)
        end
      end
    end
  end

  def edit
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
     if @tweet.type == 'Reply'
        redirect_to new_tweet_reply_path(@tweet.tweet_id)
      else
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = 'Tweet has errors!'
      if @tweet.type == 'Reply'
        redirect_to new_tweet_reply_path(@tweet.tweet_id)
      else
        redirect_to user_path(current_user)
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find_by_id(params[:id])
    if @tweet.present? && @tweet.destroy
      if @tweet.type == 'Reply'
        redirect_to new_tweet_reply_path(@tweet.tweet_id)
      else
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = 'Tweet has already been deleted!'
      redirect_to user_path(current_user)
    end
  end


  protected

  def set_type
    case params[:type]
    when 'Reply'
      'reply'
    else
      'tweet'
    end
  end


  private

  def tweet_params
    params.require(set_type.to_sym).permit(:type, :text, :tweet_id, :user_id)
  end
end
