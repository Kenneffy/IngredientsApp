class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
    	 t.string :name
   	 t.text :endpoint
   	 
     	 t.timestamps
    end
  end
end
