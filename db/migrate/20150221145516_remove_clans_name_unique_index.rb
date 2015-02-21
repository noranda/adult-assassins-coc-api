class RemoveClansNameUniqueIndex < ActiveRecord::Migration
  def up
    remove_index :clans, :name
    add_index :clans, :name
  end

  def down
    remove_index :clans, :name
    add_index :clans, :name, unique: true
  end
end
