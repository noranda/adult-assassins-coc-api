class AddFriendlyToWarPlayers < ActiveRecord::Migration
  def change
    add_column :war_players, :friendly, :boolean
  end
end
