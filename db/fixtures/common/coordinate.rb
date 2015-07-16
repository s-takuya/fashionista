module Fashionista
  class CoordinateFixtures
    def self.seed
      require 'csv'

      CSV.foreach('db/fixtures/csvs/coordinate.csv', return_headers: false, headers: :first_row) do |row|
        Coordinate.seed(:id) do |coordinate|
          coordinate.id = row['id']
          coordinate.person_name = row['person_name']
          coordinate.dress_season = row['dress_season']
          coordinate.occupation = row['occupation']
        end
      end
    end
  end
end
