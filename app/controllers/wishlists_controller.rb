class WishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wishlists, only: %i[index]
  before_action :set_wishlist, only: %i[update]

  def index; end

  def update
    @wishlist.guest = Guest.find_by(event_id: @wishlist.event_id, user: current_user)
    if @wishlist.save
      respond_to do |format|
        format.html
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
                                @wishlist,
                                WishlistComponent.new(
                                  wishlist: @wishlist,
                                  user: @wishlist.gift.user,
                                  current_user: current_user,
                                  guest: @wishlist.guest
                                )
    )}
      end
    end
  end

  private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def set_wishlists
    # event_user_wishlists GET    /events/:event_id/users/:user_id/wishlists(.:format) wishlists#index
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @wishlists = Wishlist.includes(:user, [ gift: :user ], [ gift: :photo_attachment ], :guest).where(gifts: { user: @user }, event: @event)
    @guest = @event.guests.find_by(user: current_user)
  end
end
