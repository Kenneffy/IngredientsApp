# comments.rb
class Comment < ActiveRecord::Base

	belongs_to :ingredients_recipe
	belongs_to :user

end