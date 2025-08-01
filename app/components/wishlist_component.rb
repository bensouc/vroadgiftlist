# frozen_string_literal: true

class WishlistComponent < ViewComponent::Base
  with_collection_parameter :wishlist
  def initialize(wishlist:, user:, current_user:, guest:)
    @wishlist = wishlist
    @user = user # the on who receives the gift
    @current_user = current_user
    @guest = guest # the on who offers the gift
  end
end
