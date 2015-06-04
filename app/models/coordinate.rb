class Coordinate < ActiveRecord::Base
  validates :person_name, presence: true
  validates :dress_season, presence: true
  validates :occupation, presence: true
end
