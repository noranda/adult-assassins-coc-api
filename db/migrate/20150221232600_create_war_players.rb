class CreateWarPlayers < ActiveRecord::Migration
  def change
    create_table :war_players do |t|
      t.references :player, index: true
      t.references :war, index: true

      t.timestamps null: false
    end
    add_foreign_key :war_players, :players
    add_foreign_key :war_players, :wars
  end
end
