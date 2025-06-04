class WishlistsController < ApplicationController
  def index
    @wishlist = current_user.wishlist
    @gifts = current_user.gifts.includes(:wishes)

  end
end
