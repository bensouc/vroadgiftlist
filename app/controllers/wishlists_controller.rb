class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show]
  def index
    @wishlists = current_user.wishlists
    @gifts = current_user.gifts.includes(:wishes)
  end

  def show;end

  private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
    @gifts = @wishlist.gifts
  end
end
