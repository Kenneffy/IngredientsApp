# comments_controller.rb
class CommentsController < ApplicationController

	def index
		comments = Comment.where(:ingredients_recipe_id => params[:ingredients_recipe_id])
		comments_array = []

		comments.each_with_index do |comment, i|
			comment_hash = comment.as_json
			comment_hash[:username] = comment.user.username
			comment_hash[:avatar_url] = comment.user.avatar_url
			comment_hash[:formatted_date] = comment.created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%A, %d %b %Y %l:%M %p")


			comments_array.push({
				username: comment.user.username,
				avatar_url: comment.user.avatar_url,
				comment: comment_hash

				})
			# current_comment = comments_array[i]

			# current_comment["username"] = comment.user.username
		end

		# render json: comments
		render json: comments_array
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