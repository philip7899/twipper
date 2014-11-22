class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@tweets = Tweet.all
	end

	def create

		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		@tweet.save
		#@tweet = Tweet.create(tweet_params)
		@tweets = Tweet.all
		flash[:success] = "You have a created a tweet"
		render 'new'
	end

	private

	def tweet_params
		params.require(:tweet).permit(:tweet)
	end
end
