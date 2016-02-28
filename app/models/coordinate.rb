class Coordinate < ActiveRecord::Base
  has_many :photos, as: :imageable, dependent: :destroy
  belongs_to :owner

  validates :dress_season, presence: true

  accepts_nested_attributes_for :photos

  acts_as_votable

  def self.search(owner_id)
    where(owner_id: owner_id.to_i)
  end

  def previous(owner, id)
    owner.coordinates.where('id < ?', id).order('id ASC').first
  end

  def next(owner, id)
    owner.coordinates.where('id > ?', self.id).order('id DESC').first
  end
end
