class Post < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :taggables , dependent: :destroy
  has_many :tags , through: :taggables
  has_many :ratings, dependent: :destroy
  has_one_attached :image
  has_and_belongs_to_many :users

  # Validations
  validates_presence_of :title
  validates :title, length: { maximum: 20 }
  validates_presence_of :description
  validates_presence_of :author_name


  MAX_RATING = 5
  self.per_page = 1

end
