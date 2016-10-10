class FriendsController < ApplicationController

	def index
		@friends = User.all
	end

	def create
		friend = User.find_by_id(params[:friend_id])
		current_user.friends << friend
		direct_to "/"
	end

	def destroy
		friend = Friend.find_by_user_id_friend_id(current_user_id,params[:friend_id])
		friend.destroy
		direct_to "/"
	end

end
