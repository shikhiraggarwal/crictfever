class ChangePointsToBeIntInPlayers < ActiveRecord::Migration[5.2]
  def change
  	change_column :players, :points, :integer
  end
end
