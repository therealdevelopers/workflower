class HomeController < ApplicationController
	def index
		redirect_to '/profile' if logged_in?
	end
end
