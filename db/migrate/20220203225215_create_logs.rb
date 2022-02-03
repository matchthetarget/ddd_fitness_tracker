class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :activity_id
      t.integer :user_id
      t.datetime :started_at
      t.integer :duration
      t.integer :distance
      t.integer :calories

      t.timestamps
    end
  end
end
