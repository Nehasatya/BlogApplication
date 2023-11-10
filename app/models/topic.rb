class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, through: :post
  validates_presence_of  :title

end
