class Gift < ApplicationRecord
  # Associations
  # Assuming a user has many gifts, you might want to add this association
  # Uncomment the line below if you have a User model and want to associate gifts with users
  #
  belongs_to :user
  has_many :wishes, dependent: :destroy
  has_many :wishlists, through: :wishes
  has_one_attached :photo
  # Validations
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :url, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  # Instance methods
  def link_to_wishlist(wishlist)
    # Create a new wish that links this gift to the specified wishlist
    wishes.create(wishlist: wishlist, gift: self)
  end
end
