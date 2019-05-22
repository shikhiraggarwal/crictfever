class AddProcessedColumnToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :processed, :boolean
  end
end
