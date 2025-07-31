class GiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [ :new, :create ]
  before_action :find_user, only: [:index]
  def index
    @gifts = @user.gifts.includes(:photo_attachment)

  end
  def new
    @gift = Gift.new
    @events = current_user.events
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    @event_ids = params[:gift][:events][1..-1] unless params[:gift][:events].blank?
    if @gift.save
      @gift.link_to_event(@event_ids)
      redirect_to gifts_path, notice: "Gift was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
    else
      @event = current_user.events.first
    end
  end

  def gift_params
    params.require(:gift).permit(:name, :price, :url, :photo, :tag)
  end

  def find_user
    @user = params[:user_id].nil? ? current_user : User.find(params[:user_id])
  end
end
