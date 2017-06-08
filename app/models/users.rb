class User < ActiveRecord::Base
  has_secure_password

  has_many :user_quotes
  has_many :quotes, through: :user_quotes
end
