class Quotes < ActiveRecord::Basee
  belongs_to :author
  belongs_to :topic
end
