class User < ActiveRecord::Base

	validates :username, presence: true, uniqueness: true
	has_secure_password
	has_and_belongs_to_many :ingredients_recipes
	has_many :comments
	has_many :user_tries

end