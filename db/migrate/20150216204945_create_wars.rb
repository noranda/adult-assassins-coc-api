class CreateWars < ActiveRecord::Migration
  def change
    create_table :wars do |t|
      t.datetime :start_date
      t.integer :opposing_clan_id

      t.timestamps null: false
    end

    add_index :wars, :start_date
    add_foreign_key :wars, :clans, column: :opposing_clan_id
  end
end
