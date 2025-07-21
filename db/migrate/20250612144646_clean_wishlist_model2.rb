class CleanWishlistModel2 < ActiveRecord::Migration[8.0]
  def change
    remove_column :wishlists, :master
  end
end
