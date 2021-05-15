class Pokemon < ApplicationRecord
  CATEGORIES = %w[Normal Fire Water Grass Electric Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }
  validates :name, :category, :user_id, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
