class StaticPagesController < ApplicationController

	def main_page
		if user_signed_in?
			if current_user.profile
				redirect_to profile_path(current_user.profile)
			else
				redirect_to new_profile_path
			end
		end
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
