class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent:  :destroy
  has_and_belongs_to_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
