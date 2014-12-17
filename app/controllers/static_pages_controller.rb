class StaticPagesController < ApplicationController
	acts_as_flying_saucer
	def main_page
		@variable = "yolo"
	end

	def generate_pdf
		#render 'main_page'
		render_pdf :template => 'static_pages/main_page', :send_file => { :filename => 'bar.pdf' }
	end

	def number
		@number = params[:number]
		@tweet = Tweet.where(id: @number).first
		if @tweet
			render text: "The tweet is #{@tweet.tweet}"
		else
			render text: "No such tweet exists"
		end
	end
end
