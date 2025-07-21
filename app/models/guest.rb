class Guest < ApplicationRecord
  belongs_to :event
  belongs_to :gift
  belongs_to :wishlist

end
