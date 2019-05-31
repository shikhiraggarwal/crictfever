class AddNrToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :nr, :integer
  end
end
