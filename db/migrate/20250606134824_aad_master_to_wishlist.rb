class AadMasterToEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :master, :boolean
  end
end
