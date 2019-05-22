class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :team1
      t.integer :team2
      t.decimal :winteam1, precision: 4, scale: 2
      t.decimal :winteam2, precision: 4, scale: 2
      t.datetime :matchtime

      t.timestamps
    end
  end
end
