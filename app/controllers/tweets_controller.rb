class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@tweets = Tweet.all
	end

	def create
		@tweet = Tweet.create(tweet_params)
		@tweets = Tweet.all
		flash[:success] = "You have a created a tweet"
		render 'new'
	end

	private

	def tweet_params
		params.require(:tweet).permit(:tweet)
	end
end
