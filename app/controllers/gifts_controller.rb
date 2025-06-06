class GiftsController < ApplicationController
  before_action :set_wishlist, only: [ :new, :create ]
  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    @wishlist = Wishlist.find(params[:gift][:wishlist_id])
    if @gift.save
      @gift.link_to_wishlist(@wishlist)
      redirect_to wishlist_path(@wishlist), notice: 'Gift was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_wishlist
    if params[:wishlist_id].present?
      @wishlist = Wishlist.find(params[:wishlist_id])
    else
      @wishlist = current_user.wishlists.first
    end
  end

  def gift_params
    params.require(:gift).permit(:name, :price,:url, :photo, :tag)
  end
end
