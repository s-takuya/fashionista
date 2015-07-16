module Fashionista
  class CoordinatePhotoFixtures
    def self.seed
      require 'csv'

      CSV.foreach('db/fixtures/csvs/coordinate_photo.csv', return_headers: false, headers: :first_row) do |row|
        Photo.seed do |photo|
          photo.id = row['id']
          photo.imageable = Coordinate.find(row['coordinate_imageable_id'])
          photo.image = File.open("#{Rails.root.join(row['image'])}")
        end
      end
    end
  end
end
