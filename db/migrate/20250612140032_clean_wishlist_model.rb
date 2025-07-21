class CleanWishlistModel < ActiveRecord::Migration[8.0]
  def change
    remove_column :wishlists, :name
  end
end
