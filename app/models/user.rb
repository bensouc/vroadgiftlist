class User < ApplicationRecord
  after_create_commit :create_wishlist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # associations
  has_one_attached :avatar
  has_one :wishlist, dependent: :destroy
  has_many :gifts, dependent: :destroy

  # validations
  validates :user_name, presence: true

  private
  def create_wishlist
    Wishlist.create!(user: self)
  end
end
