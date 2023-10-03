class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :taggables , dependent: :destroy
  has_many :tags , through: :taggables
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :author_name
  has_many :ratings, dependent: :destroy
  has_one_attached :image

  MAX_RATING = 5
  self.per_page = 1

end
