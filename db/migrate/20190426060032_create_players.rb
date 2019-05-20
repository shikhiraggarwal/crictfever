class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :points
      t.string :pincode
      t.string :password
      t.blob :data

      t.timestamps
    end
  end
end
