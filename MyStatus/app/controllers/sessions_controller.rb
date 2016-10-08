class SessionsController < ApplicationController
	before_action :authorize, except: [:new, :create]
	def new
	end

	def create
		@users = User.find_by(Username: params[:Username])
		if @users and User.find_by(Password: params[:Password])
			session[:current_user_id] = @users.id
			redirect_to root_path
		else
			render :new
		end
	end

	def destroy
		session[:current_user_id]= nil;
		redirect_to root_path
	end
end