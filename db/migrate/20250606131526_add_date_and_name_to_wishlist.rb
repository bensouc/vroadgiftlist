class AddDateAndNameToEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :date, :date
    add_column :events, :name, :string
  end
end
