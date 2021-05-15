class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  has_many :reviews

  # validates :pokemon_id, uniqueness: { scope: :user_id }

end
