class IngredientsRecipesController < ApplicationController

	def index
		render layout: 'application', text: ''
	end

	def search
		search_results = IngredientsRecipe.search(params[:search])
		recipes = search_results["recipes"]
		render json: recipes
	end

	def show
		check = IngredientsRecipe.find_by_f2f_recipe_id(params[:id])

		if check 
			search_results = IngredientsRecipe.search_by_id(check.f2f_recipe_id)
			# binding.pry
			arr = []
			check.comments.each do |c|
				temp = c.as_json
				temp[:username] = c.user.username
				temp[:avatar_url] = c.user.avatar_url
				temp[:formatted_date] = c.created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%A, %d %b %Y %l:%M %p")

				arr.push temp
			end

			full_data = {recipe: search_results, comments: arr} #before we had check.comments here but it didnt have the username or avatar_url
			render json: full_data
			# binding.pry

		else
			
			search_results = IngredientsRecipe.search_by_id(params[:id])

			full_data = {recipe: search_results, comments: []}
			render json: full_data
		end
	end

	def create
		check = IngredientsRecipe.find_by_f2f_recipe_id(params[:ingredients_recipe][:f2f_recipe_id]
)
		#binding.pry

		if check
			render json: check
		else
			ingredients_recipe = IngredientsRecipe.new(ingredients_recipe_params)

			ingredients_recipe.save
			render json: ingredients_recipe
		end
	end

	def ingredients_recipe_params
		params.require(:ingredients_recipe).permit(:name, :endpoint, :f2f_recipe_id, :f2f_img_url)
	end


end