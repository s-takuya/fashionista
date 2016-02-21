class CoordinateOwner < ActiveRecord::Base
  belongs_to :coordinate, required: true
  belongs_to :owner, required: true
end
