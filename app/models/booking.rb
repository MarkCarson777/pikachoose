class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  has_many :reviews, dependent: :destroy

  # validates :pokemon_id, uniqueness: { scope: :user_id }
end
