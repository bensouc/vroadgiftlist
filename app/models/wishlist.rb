class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishes, dependent: :destroy
  has_many :gifts, through: :wishes
end
