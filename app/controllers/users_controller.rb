class UsersController < ApplicationController
	include UsersHelper
	
	def new
		begin
			@user = User.new if @user.nil?
		rescue 
			@user = User.new
		end
	end

	def create
		@user = User.new(user_new_params)
		@user.schedules << Schedule.new(title: 'Main')
		if sign_up @user
			redirect_to root_url
		else
			render 'new'
		end
	end


	def show_profile
		if(current_user.nil?)
			redirect_to root_url, notice: "Please, sign in!"
		else
			@user = current_user
		end
	end

	def show
		if (params[:username] == current_user.login)
			redirect_to user_path
		else
			@user = User.find_by params[login: :username]
			if @user
				render 'guest'
			else
				redirect_to root_url, notice: "Sorry, we can't find any user with this login."
			end
		end
	end

	def update
		@user.save if can_update? @user.id
	end

	def edit
		@user = User.find(params[:id]) if can_edit? params[:id]
	end

	def destroy
		User.destroy(params[:id]) if can_destroy? params[:id]
	end

	def guest
	end

	private
	def user_new_params
		params.require(:user)
			.permit(:login, 
					:email, 
					:password, 
					:password_confirmation, 
					:name, 
					:links, 
					:image)
	end

	def user_update_params
		params.require(:user)
			.permit(:id,
					:email,
					:name,
					:links,
					:image)
	end

	def user_pass_change_params
		params.require(:user)
			.permit(:id,
					:old_password,
					:new_password,
					:new_password_confirmation)
	end
end
