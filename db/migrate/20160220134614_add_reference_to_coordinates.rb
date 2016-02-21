class AddReferenceToCoordinates < ActiveRecord::Migration
  def change
    add_reference :coordinates, :owner, index: true
  end
end
