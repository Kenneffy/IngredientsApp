class CreateJoinTableUserIngredientsRecipe < ActiveRecord::Migration
  def change
    create_join_table :users, :ingredients_recipes do |t|
     # t.index [:user_id, :ingredients_recipe_id]
     # t.index [:ingredients_recipe_id, :user_id]
    end
  end
end
