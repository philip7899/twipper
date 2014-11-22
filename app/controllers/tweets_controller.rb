class TweetsController < ApplicationController

	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
		@tweets = current_user.tweets
	end

	def create

		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
			flash[:success] = "You have a created a tweet"
		else
			flash[:danger] = "Please fix the problems below."
		end
		#@tweet = Tweet.create(tweet_params)
		@tweets = current_user.tweets
		
		render 'new'
	end

	def index
		@tweets = Tweet.all.reject {|tweet| tweet.user == current_user}
	end

	private

	def tweet_params
		params.require(:tweet).permit(:tweet)
	end
end
