class DestroyEventsTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :events
  end

  def down
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
