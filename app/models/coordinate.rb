class Coordinate < ActiveRecord::Base
  validates :person_name, presence: true
  validates :dress_season, presence: true
  validates :occupation, presence: true
  has_many :photos, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :photos
end
