class Rating < ApplicationRecord
  belongs_to :post

  validates :stars, numericality: { in: 0..5 }

# Callbacks
  after_create :update_ratings_average

  def update_ratings_average
    self.post.update_ratings_average
  end

end
