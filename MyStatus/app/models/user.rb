class User < ApplicationRecord
	has_many :status

	has_many :friends
	has_many :friends_users, :through => :friends

end
