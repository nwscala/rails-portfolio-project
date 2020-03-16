class Bird < ApplicationRecord
    has_many :sightings
    has_many :birdwatchers, through: :sightings
end
