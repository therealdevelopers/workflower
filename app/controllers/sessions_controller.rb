class SessionsController < ApplicationController
  def new
  end

  def create
    #byebug
  	user = sign_in params[:identifier]

    if user && user.authenticate(params[:password])
      log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to profile_path
  	else
  	  flash.now.alert = "Invalid login or password!"
  	  render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
