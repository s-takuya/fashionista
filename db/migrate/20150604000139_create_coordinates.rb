class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :person_name, null: false
      t.string :occupation,  null: false
      t.string :dress_season,      null: false

      t.timestamps null: false
    end
  end
end
