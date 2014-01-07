class User < ActiveRecord::Base
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id
  has_many :votes, as: :voteable
  has_secure_password validations: false
  validates :username, presence: true, length: {minimum: 5}
  validates :password, presence: true, length: {minimum: 5}
  
end