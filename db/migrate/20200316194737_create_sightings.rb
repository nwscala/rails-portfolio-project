class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.belongs_to :birdwatcher, foreign_key: true
      t.belongs_to :bird, foreign_key: true
      t.string :location
      t.string :time_of_day
      t.string :time_of_year

      t.timestamps
    end
  end
end
