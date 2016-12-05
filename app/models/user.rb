class User < ActiveRecord::Base
  has_many :articles
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :password_digest, :email, presence: true
  validates :username, length: { minimum: 3, maximum: 25}, uniqueness: { case_sensitive: false }
  validates :email, length: { maximum: 250 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

end
