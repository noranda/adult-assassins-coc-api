class AddPositionToWarPlayers < ActiveRecord::Migration
  def change
    add_column :war_players, :position, :integer
  end
end
