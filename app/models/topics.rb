class Topic < ActiveRecord::Base
  has_many :quotes

  validates :name, presence: true
end
