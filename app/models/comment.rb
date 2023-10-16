class Comment < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :post, counter_cache: true
  belongs_to :topic, optional: true
  has_many :user_comment_ratings, dependent: :destroy
  has_many :users, through: :user_comment_ratings

  # nested attributes
  accepts_nested_attributes_for :user_comment_ratings

  # validations
  validates_presence_of :com_description
end
