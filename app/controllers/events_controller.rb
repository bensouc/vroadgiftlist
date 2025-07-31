class EventsController < ApplicationController
  before_action :set_event, only: [ :show ]
  def index
    @events = current_user.all_events
    @gifts = current_user.gifts.includes(:wishes)
  end

  def show;end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :date))
    @event.organizer = current_user
    if @event.save
      redirect_to events_path, notice: I18n.t("events.create.success", name: @event.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: I18n.t("events.destroy.success", name: @event.name) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@event) }
    end
  end


  private

  def set_event
    @event = Event.find(params[:id])
    @gifts = @event.gifts
  end
end
