class User < ActiveRecord::Base
  has_secure_password

  validates :username, :password, :password_confirmation, presence: true

  has_many :user_quotes
  has_many :quotes, through: :user_quotes

  has_many :topics, through: :quotes
end
