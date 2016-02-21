class RemoveColumnFromCoordinates < ActiveRecord::Migration
  def change
    remove_column :coordinates, :person_name
    remove_column :coordinates, :occupation
  end
end
