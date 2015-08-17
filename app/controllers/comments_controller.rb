# comments_controller.rb
class CommentsController < ApplicationController

	def index
		comments = Comment.where(:ingredients_recipe_id => params[:ingredients_recipe_id])
		render json: comments
	end

	def create
		comment = Comment.new(comment_params)
		comment.user_id = session[:current_user_id]
		comment.save
		render json: comment
	end

	def comment_params
		params.require(:comment).permit(:comment, :ingredients_recipe_id)
	end


end