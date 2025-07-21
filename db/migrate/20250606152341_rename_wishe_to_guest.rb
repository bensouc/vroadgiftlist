class RenameWisheToGuest < ActiveRecord::Migration[8.0]
  def change
    rename_table :wishes, :guests
  end
end
