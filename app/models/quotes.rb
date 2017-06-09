class Quote < ActiveRecord::Base
  belongs_to :author
  belongs_to :topic

  has_many :user_quotes
  has_many :users, through: :user_quotes

  validates_presence_of :quote
end
