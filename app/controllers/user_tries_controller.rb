class UserTriesController < ApplicationController

    def create
        user_try = UserTry.new(user_try_params)
        user_try.user_id = session[:current_user_id]
        user_try.save
        render json: user_try
    end

    def user_try_params
        params.require(:user_try).permit(:try, :ingredients_recipe_id)
    end

    def edit
        user_try = UserTry.find(params[:id])
        user_try.try = false
        user_try.save
        redirect_to '/users/' + session[:current_user_id].to_s
    end


end