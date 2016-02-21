class Coordinate < ActiveRecord::Base
  has_many :photos, as: :imageable, dependent: :destroy
  belongs_to :owner

  validates :dress_season, presence: true

  accepts_nested_attributes_for :photos

  def self.search(owner_id, dress_season)
    where('owner_id = ? AND dress_season = ?', owner_id.to_i, "#{dress_season}")
  end
end
