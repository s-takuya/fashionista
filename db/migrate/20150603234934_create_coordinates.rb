class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :person_name, null: false
      t.string :season,      null: false
      t.string :occupation

      t.timestamps null: false
    end
  end
end
