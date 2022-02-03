class AddActivityReferenceToLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logs, :activities
    add_index :logs, :activity_id
    change_column_null :logs, :activity_id, false
  end
end
