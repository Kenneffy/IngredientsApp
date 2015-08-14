class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :avatar_url, :text
  	add_column :users, :email, :string
  end
end
