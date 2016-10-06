class SessionsController < ApplicationController
	before_action :authorize, except: [:new, :create]
	def new
	end

	def create
		@users = User.find_by(username: params[:Username]).authenticate(:Password)
		if @users
			session[:current_user_id]=@users.id
			redirect_to users_path
		else
			render :new
		end
	end

	def destroy
	end
end