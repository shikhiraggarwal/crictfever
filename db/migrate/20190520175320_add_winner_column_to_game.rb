class AddWinnerColumnToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :winner, :integer
    add_column :games, :finished, :boolean
  end
end
