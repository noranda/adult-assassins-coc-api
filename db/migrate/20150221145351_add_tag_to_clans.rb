class AddTagToClans < ActiveRecord::Migration
  def change
    add_column :clans, :tag, :string
    add_index :clans, :tag, unique: true
  end
end
