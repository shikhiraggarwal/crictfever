class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :image
      t.integer :rank
      t.decimal :game_points, precision: 5, scale: 2
      t.boolean :negative
      t.decimal :run_rate, precision: 6, scale: 3

      t.timestamps
    end
  end
end
