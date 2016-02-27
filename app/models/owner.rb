class Owner < ActiveRecord::Base
  has_many :coordinates, dependent: :destroy

  scope :recent, -> { order(updated_at: :desc) }
  scope :man, -> { where(man_flag: true) }
  scope :woman, -> { where(woman_flag: true) }
end
