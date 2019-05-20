class AddShareIdColumnToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :share_id, :string
    add_index :players, :share_id, :unique => true
  end
end
