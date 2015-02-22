class CreateAttackLogs < ActiveRecord::Migration
  def change
    create_table :attack_logs do |t|
      t.integer :attacker_id
      t.integer :target_id
      t.integer :score
      t.datetime :time

      t.timestamps null: false
    end

    add_foreign_key :attack_logs, :war_players, column: :attacker_id
    add_foreign_key :attack_logs, :war_players, column: :target_id
    add_index :attack_logs, :time
  end
end
