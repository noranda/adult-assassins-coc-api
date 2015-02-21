class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.datetime :end_date

      t.timestamps null: false
    end

    add_index :timers, :end_date
  end
end
