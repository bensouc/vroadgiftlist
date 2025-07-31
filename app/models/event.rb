class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: "user_id" # event organiser
  has_many :guests, dependent: :destroy
  has_many :guest_users, through: :guests, source: :user # associations User renamed as guest_users and source is the belongs_to from Guest
  has_many :wishlists, dependent: :destroy
  has_many :gifts, through: :wishlists

  def participants
    # Returns a list of users who have been added to this event via wishes table
    # return an empty array if there are no guests, or if the guests are not present
    User.where(id: guest_users.pluck(:id) + [organizer.id]).distinct
  end

  def add_participant(user)
    Guest.create!(user:, event: self)
  end
end
