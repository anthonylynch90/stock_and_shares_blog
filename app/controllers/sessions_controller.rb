class SessionsController < ApplicationController

	def new
	end

	def create
		email = params[:session][:email]
		password = params[:session][:password]
		@user = User.find_by_email(email)
		if @user && @user.authenticate(password)
			redirect_to @user
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
	end

end
