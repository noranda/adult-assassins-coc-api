class CreateClans < ActiveRecord::Migration
  def change
    create_table :clans do |t|
      t.string :name

      t.timestamps null: false
    end

    add_index :clans, :name, unique: true
  end
end
