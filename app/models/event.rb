class Event < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :gifts, through: :wishlists

  def participants
    # Returns a list of users who have been added to this event via wishes table
    # return an empty array if there are no guests, or if the guests are not present
    return [] if guests.empty? || guests.all? { |guest| guest.user.nil? }

    guests.map do |guest|
      guest.user if guest.user.present?
    end.compact.uniq
  end
end
