class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :topic, optional: true
  validates_presence_of :com_description
end
