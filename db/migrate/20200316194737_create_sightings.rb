class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.birdwatcher :belongs_to
      t.bird :belongs_to
      t.string :location
      t.string :time_of_day
      t.string :time_of_year

      t.timestamps
    end
  end
end
