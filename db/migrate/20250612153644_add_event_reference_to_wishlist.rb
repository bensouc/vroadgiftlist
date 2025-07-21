class AddEventReferenceToWishlist < ActiveRecord::Migration[8.0]
  def change
    add_reference :wishlists, :event, null: false, foreign_key: true
    remove_reference :guests, :gift, index: true
  end
end
