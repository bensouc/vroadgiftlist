# frozen_string_literal: true

class WishlistUpdateComponent < ViewComponent::Base
  def initialize(wishlist:, user:)
    @wishlist = wishlist
    @user = user
  end

  def render?
    @user != @wishlist.user
  end
end
