# frozen_string_literal: true

# Gift model represents a gift that can be added to a event
class Gift < ApplicationRecord
  # Include URL helpers for generating URLs
  include Rails.application.routes.url_helpers

  # Associations
  belongs_to :user
  has_many :wishlists, dependent: :destroy
  has_many :events, through: :wishlists
  has_one_attached :photo
  # Validations
  validates :name, presence: true
  validates :user, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :url, format: { with: URI.regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  # Tags
  TAGS = [
  "tech",
  "fashion",
  "hobbies",
  "home",
  "video_games",
  "books",
  "comics",
  "beauty",
  "music",
  "sports",
  "travel",
  "experience",
  "food",
  "decor",
  "blu_ray_4k",
  "blu_ray",
  "dvd"
].freeze

  # Instance methods
  def link_to_events(events)
    # Create a new wish that links this gift to the specified event
    events.each {|id| Wishlist.create(event_id: id, gift: self)}
  end

  def price_to_s
    if !price.blank?
      price.to_s
    else
      "??"
    end
  end
end
