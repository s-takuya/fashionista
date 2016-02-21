class Owner < ActiveRecord::Base
  has_many :coordinates, dependent: :destroy

  scope :recent, -> { order(updated_at: :desc) }
end
