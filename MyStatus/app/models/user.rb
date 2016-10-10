class User < ApplicationRecord
	has_many :status

	has_many :friends, through: :friends_users
	has_many :friends_users, through: :Friends

end
