class UsersController < ApplicationController

	before_action :authenticate, except: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:current_user_id] = @user.id
			redirect_to ingredients_recipes_index_path
		else
			redirect_to root_path
		end
	end

	def show
		
		@user = User.find(params[:id]);
		@ingredients_recipes = IngredientsRecipe.find(@user.user_tries.pluck(:ingredients_recipe_id))
		
		# @ingredients_recipe = IngredientsRecipe.where(:user_id => (params[:id]))
		# puts @ingredients_recipe
		# puts IngredientsRecipe
		# # # recipes

		# data = {
		# 	user:key => "value",  user,
		# 	user_tries: user_tries
		# }

		# render :json data
	
	end

	def destroy
		@user = User.find(params[:id])
		session[:current_user_id] = nil
		@user.destroy
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end

end