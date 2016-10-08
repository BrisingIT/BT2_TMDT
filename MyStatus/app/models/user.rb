class User < ApplicationRecord
	has_many :status, :dependent => destroy
end
