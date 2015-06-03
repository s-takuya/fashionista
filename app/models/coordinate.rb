class Coordinate < ActiveRecord::Base
  validates :person_name, presence: true
  validates :season, presence: true
end
