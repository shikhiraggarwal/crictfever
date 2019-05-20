class ChangePlayersCloumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :device_id, :device
    rename_column :players, :share_id, :share_code
  end
end
