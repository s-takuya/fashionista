class Coordinate < ActiveRecord::Base
  validates :person_name, presence: true
  validates :dress_season, presence: true
  validates :occupation, presence: true

  has_attached_file :image
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
