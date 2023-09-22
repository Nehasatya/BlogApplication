class Rating < ApplicationRecord
  belongs_to :post

  validates :stars, numericality: { in: 0..5 }
end
