class Tag < ApplicationRecord
  has_many :taggables , dependent: :destroy
  has_many :posts, through: :taggables
  validates_presence_of :name

end
