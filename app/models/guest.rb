class Guest < ApplicationRecord
  belongs_to :event
  belongs_to :wishlist, optional: true
  belongs_to :user

  # validations
  validates :user, presence: :true
  validates :event, presence: :true
end
