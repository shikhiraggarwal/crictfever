class AddGameToReward < ActiveRecord::Migration[5.2]
  def change
    add_column :rewards, :game, :string
  end
end
