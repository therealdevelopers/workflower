 module SessionsHelper

  #log user session
	def log_in user
		session[:user_id] = user.id
	end

  #try to get the user from db by identifier, but do not auth him
  def sign_in identifier
    User.find_by(login: identifier) || User.find_by(email: identifier)
  end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	def current_user
    	if (user_id = session[:user_id])
      		@current_user ||= User.find(user_id)
    	elsif (user_id = cookies.signed[:user_id])
      		user = User.find(user_id)
      		if user && user.authenticated?(cookies[:remember_token])
        		log_in user
        		@current_user = user
      		end
    	end
  	end

  	def logged_in?
  		!current_user.nil?
  	end

  	def remember(user)
    	user.remember
    	cookies.permanent.signed[:user_id] = user.id
    	cookies.permanent[:remember_token] = user.remember_token
  	end

  	def forget(user)
  		user.forget
    	cookies.delete(:user_id)
    	cookies.delete(:remember_token)
  	end

    def resolve_remember(val, user)
      val == '1' ? remember(user) : forget(user)
    end
end
