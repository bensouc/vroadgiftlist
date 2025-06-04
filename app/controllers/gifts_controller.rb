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
      redirect_to wishlists_path, notice: 'Gift was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_wishlist
    @wishlist = current_user.wishlist
  end

  def gift_params
    params.require(:gift).permit(:name, :price,:url, :photo)
  end
end
