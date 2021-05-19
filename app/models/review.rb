class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, numericality: true, presence: true, inclusion: { in: 0..5, allow_nil: false }
end
