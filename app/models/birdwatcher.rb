class Birdwatcher < ApplicationRecord
    has_many :sightings
    has_many :birds, through: :sightings

    def self.ornithologist
        where(ornithologist: true)
    end
end
