class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :player
      t.integer :game
      t.integer :team
      t.integer :points

      t.timestamps
    end
  end
end
