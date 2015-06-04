class AddAttachmentImageToCoordinates < ActiveRecord::Migration
  def self.up
    add_attachment :coordinates, :image
  end

  def self.down
    remove_attachment :coordinates, :image
  end
end
