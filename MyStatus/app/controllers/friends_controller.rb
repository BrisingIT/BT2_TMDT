class FriendsController < ApplicationController

	def index
		@user = User.find(session[:current_user_id])
	end

	def create
		user = User.find(session[:current_user_id])
		@friends = user.friends.build(:friend_id => params[:friend_id])
    	@friends.save
		redirect_to "/"
	end

	def destroy
		user = User.find(session[:current_user_id])
		@friends = user.friendships.find(params[:id])
  		@friends.destroy
		redirect_to "/"
	end

end
