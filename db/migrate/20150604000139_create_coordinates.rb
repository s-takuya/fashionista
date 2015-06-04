class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :person_name, null: true
      t.string :occupation
      t.string :season,      null: true

      t.timestamps null: false
    end
  end
end
