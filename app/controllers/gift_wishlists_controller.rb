class GiftWishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :wishlist_params, only: [:create]
  def create
    @wishlist = Wishlist.new(wishlist_params)
  end

  private
  def wishlist_params
    params.permit(:event_id, :gift_id)
  end
end
