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
		# user = User.find(params[:id]);
		# user_tries = user.user_tries;
		# # recipes

		# data = {
		# 	user: user,
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