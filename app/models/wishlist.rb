class Wishlist < ApplicationRecord
  belongs_to :gift
  belongs_to :event
  belongs_to :guest, optional: true # the on who offers the gift
  has_one :user, through: :gift  # the one who recieves the gift

  def is_taken?
    !guest_id.nil?
  end

  def own_by?(a_user)
    user == a_user
  end
end
