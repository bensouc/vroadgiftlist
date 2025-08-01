# frozen_string_literal: true

class GiftEventBtnComponent < ViewComponent::Base
  def initialize(user:, gift:,event:, current_user:, guest:)
    @user = user
    @gift = gift
    @guest = guest
    @event = event
    @current_user = current_user
  end

  def render?
    @user != @current_user
  end
end
