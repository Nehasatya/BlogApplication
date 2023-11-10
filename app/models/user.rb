class User < ApplicationRecord
  # ==============Association============
  has_many :posts, dependent: :destroy
  has_many :comments, dependent:  :destroy
  has_and_belongs_to_many :posts, dependent: :destroy
  has_many :user_comment_ratings, dependent: :destroy
  has_many :comments, through: :user_comment_ratings
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
#   ================Model Callbacks=====================
  after_create :send_email

#   ================Methods==============================

  def send_email
    # UserMailer.with(user: self).welcome_email.deliver_now
    WelcomeEmailJob.perform_later(self)
  end

end
