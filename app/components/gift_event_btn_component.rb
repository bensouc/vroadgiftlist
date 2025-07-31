# frozen_string_literal: true

class GiftEventBtnComponent < ViewComponent::Base
  def initialize(user:, gift:, current_user:)
    @user = user
    @gift = gift
    @current_user = current_user
  end

  def render?
    @user != @current_user
  end
end
