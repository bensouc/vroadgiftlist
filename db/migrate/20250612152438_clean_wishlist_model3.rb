class CleanWishlistModel3 < ActiveRecord::Migration[8.0]
  def change
    remove_column :wishlists, :name
    remove_column :wishlists, :date
    remove_reference :wishlists, :user, foreign_key: true
    add_reference :wishlists, :guest, null: true
  end
end
