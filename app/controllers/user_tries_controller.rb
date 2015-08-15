class UserTriesController < ApplicationController

	def create
		binding.pry
		user_try = UserTry.new(user_try_params)
		binding.pry
		user_try.user_id = session[:current_user_id]
		user_try.save
		render json: user_try
	end

	def user_try_params
		params.require(:user_try).permit(:try, :ingredients_recipe_id)
	end


end