class AddForeignIdColumns < ActiveRecord::Migration
  def change
  	add_column :user_tries, :user_id, :integer
  	add_column :user_tries, :ingredients_recipe_id, :integer
  	add_column :comments, :user_id, :integer
  	add_column :comments, :ingredients_recipe_id, :integer

  end
end


    # rails generate migration CreateJoinTableUserIngredientsRecipe user ingredients_recipe
    # rails generate migration CreateJoinTableUserIngredientsRecipe user ingredients_recipe
    # rails generate migration CreateJoinTableUserIngredientsRecipe user ingredients_recipe
