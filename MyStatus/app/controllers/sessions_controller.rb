class SessionsController < ApplicationController
	before_action :authorize, except: [:new, :create]
	def new
	end

	def create
		user = User.find_by(Username: params[:Username])
		if user and user.authenticate(params[:Password])
			session[:current_user_id] = @users.id
			redirect_to users_path
		else
			render :new
		end
	end

	def destroy
	end
end