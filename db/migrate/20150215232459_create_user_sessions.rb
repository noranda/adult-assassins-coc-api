class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.references :user, index: true
      t.string :token, null: false
      t.datetime :accessed_at, null: false, index: true
      t.datetime :revoked_at, index: true
      t.string :ip
      t.string :user_agent

      t.timestamps null: false
    end

    add_foreign_key :user_sessions, :users
    add_index :user_sessions, :token, unique: true
  end
end
