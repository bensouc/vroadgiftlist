class RemoveEvent < ActiveRecord::Migration[8.0]
  def change
    remove_reference :wishlists, :event, index: true, foreign_key: true
    add_reference :wishes, :event, index: true
    add_reference :gifts, :user, index: true, foreign_key: true
  end
end
