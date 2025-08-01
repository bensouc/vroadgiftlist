class EventsController < ApplicationController
  before_action :store_user_location!, only: [:join]
  before_action :authenticate_user!
  before_action :set_event, only: [ :show]
  before_action :set_event_by_token, only: [ :join]
  before_action :set_gifts, only: [ :show ]
  before_action :set_participants, only: [ :show ]
  before_action :set_guest, only: [:show]
  def index
    @events = current_user.all_events.includes(:organizer)
    @gifts = current_user.gifts.includes(:wishes)
  end

  def show;end

  def new
    @event = Event.new
  end

  def join
    # Si utilisateur déjà participant, on peut rediriger ou informer
    if @event.guests.exists?(user_id: current_user.id)
      redirect_to @event, notice: I18n.t("event.join.already_joined")
      return
    end

    # Ajout du participant
    @event.add_participant(current_user)

    redirect_to @event, notice: I18n.t("event.join.success")
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :date))
    @event.organizer = current_user
    @event.add_participant(current_user)
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
    @event = Event.includes(guests: :user).find(params[:id])
  end

  def set_event_by_token
    @event = Event.find_by(invite_token: params[:invite_token])
  end

  def set_gifts
    @gifts = @event.gifts
  end
  def set_participants
    @participants = @event.participants
  end
  def set_guest
    @event.guests.find_by(user: current_user)
  end
end
