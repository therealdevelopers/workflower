class HomeController < ApplicationController
	def index
		render 'users/show_profile' if logged_in?
	end
end
