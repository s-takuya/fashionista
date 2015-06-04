class Coordinate < ActiveRecord::Base
  validates :person_name, persence: true
  validates :season, presence: true
  validates :occupation, presence: true
end
