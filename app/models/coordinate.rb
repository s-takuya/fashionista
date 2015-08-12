class Coordinate < ActiveRecord::Base
  validates :person_name, presence: true
  validates :dress_season, presence: true
  validates :occupation, presence: true
  has_many :photos, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :photos

  def self.search(person_name, dress_season)
    where('person_name = ? AND dress_season = ?', 'person_name', 'dress_season')
  end
end
