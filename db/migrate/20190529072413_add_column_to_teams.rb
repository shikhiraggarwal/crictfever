class AddColumnToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :won, :integer
    add_column :teams, :lost, :integer
    add_column :teams, :played, :integer
    add_column :teams, :last, :boolean
  end
end
