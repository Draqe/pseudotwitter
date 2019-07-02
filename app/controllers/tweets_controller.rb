class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all
	end

	def new
		
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			redirect_to @tweet
		else
			render 'new'
		end
	end

	private
		def tweet_params
			params.require(:tweet).permit(:user_id, :text)
		end
end
