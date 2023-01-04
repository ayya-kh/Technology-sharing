class Contribution < ApplicationRecord
  has_one_attached :video
  validates :title, length: { in: 1..100 }
end
