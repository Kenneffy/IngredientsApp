class CreateUserTries < ActiveRecord::Migration
  def change
    create_table :user_tries do |t|
    	# true means they've tried it
    	# false means they want to try it but haven't yet.
    	t.boolean :try
    end
  end
end
