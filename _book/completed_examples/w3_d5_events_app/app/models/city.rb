class City < ActiveRecord::Base
  has_many :clubs
  has_many :events, through: :clubs
end
