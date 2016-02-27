class AddColumnToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :man_flag, :boolean
    add_column :owners, :woman_flag, :boolean
  end
end
