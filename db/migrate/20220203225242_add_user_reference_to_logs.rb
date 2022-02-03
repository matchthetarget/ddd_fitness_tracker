class AddUserReferenceToLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logs, :users
    add_index :logs, :user_id
    change_column_null :logs, :user_id, false
  end
end
