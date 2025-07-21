class User < ApplicationRecord
  # after_create_commit :create_event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # associations
  has_one_attached :avatar
  has_many :events, dependent: :destroy
  has_many :gifts, dependent: :destroy

  # validations
  validates :user_name, presence: true
end
