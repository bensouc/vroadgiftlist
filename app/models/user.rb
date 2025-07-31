class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  # associations
  has_one_attached :avatar
  has_many :events, dependent: :destroy
  has_many :gifts, dependent: :destroy
  has_many :participations, class_name: "Guest"
  # Événements auxquels l'utilisateur participe (via la table guests)
  has_many :attended_events, through: :participations, source: :event

  # validations
  validates :user_name, presence: true


  def all_events # return all linked events attended and organized
    Event.where(id: events.pluck(:id) + attended_events.pluck(:id)).distinct
  end
end
