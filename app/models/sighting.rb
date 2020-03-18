class Sighting < ApplicationRecord
    belongs_to :bird
    belongs_to :birdwatcher
    validates :location, presence: true
    validates :time_of_day, presence: true
    validates :time_of_year, presence: true
end
