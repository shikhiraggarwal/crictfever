class AddIndexToPlayers < ActiveRecord::Migration[5.2]
  def change  	
      add_index :players, :name
      add_index :players, :email, :unique => true
      add_index :players, :pincode
      add_index :players, :phone, :unique => true
      add_index :players, :points
  end
end
