class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :desc
      t.integer :amount
      t.integer :rank_start
      t.integer :rank_end
      t.text :data

      t.timestamps
    end
  end
end
