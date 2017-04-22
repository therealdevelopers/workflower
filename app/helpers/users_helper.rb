module UsersHelper
	def can_destroy? user_id
		return current_user.id == user_id || current_user.is_admin?
	end

	def can_update? user_id
		return current_user.id == user_id
	end

	def can_edit? user_id
		return current_user.id == user_id
	end

	def sign_up user
		user.save
	end

	def resolve_remember remember
		
	end
end
