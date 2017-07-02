class HomeController < ApplicationController
	def index
		render 'users/show_profile'
	end
end
