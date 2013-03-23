module SessionsHelper

	def sign_in(user)
		cookies.permenant[:remember_token] = user.remember_token
		self.current_user = user
	end

end
