class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  # validates :pokemon_id, uniqueness: { scope: :user_id }

end
