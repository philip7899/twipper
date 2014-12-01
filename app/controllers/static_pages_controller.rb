class StaticPagesController < ApplicationController
	acts_as_flying_saucer
	def main_page
		@variable = "yolo"
	end

	def generate_pdf
		#render 'main_page'
		render_pdf :template => 'static_pages/main_page', :send_file => { :filename => 'bar.pdf' }
	end
end
