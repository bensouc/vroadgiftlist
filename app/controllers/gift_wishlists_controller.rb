class GiftWishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :wishlist_params, only: [:create]
  def create
    @wishlist = Wishlist.new(wishlist_params)
    if @wishlist.save
      respond_to do |format|
          format.html
          format.turbo_stream {
            render WishlistComponent.new(wishlist: @wishlist, user:@wishlist.user, current_user:, guest:)
          }
      end
    end
  end

  private
  def wishlist_params
    params.permit(:event_id, :gift_id, :guest_id)
  end
end
