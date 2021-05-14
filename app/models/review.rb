class Review < ApplicationRecord
  belongs_to :pokemon
  
  validates :content, presence: true
end
