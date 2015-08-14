class AddColumnsToIngredientsRecipes < ActiveRecord::Migration
  def change
  	add_column :ingredients_recipes, :f2f_recipe_id, :string
  	add_column :ingredients_recipes, :f2f_img_url, :string
  end
end
