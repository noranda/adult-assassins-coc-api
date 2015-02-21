class AddWarSizeToWars < ActiveRecord::Migration
  def change
    add_column :wars, :war_size, :integer
  end
end
