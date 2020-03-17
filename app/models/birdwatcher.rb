class Birdwatcher < ApplicationRecord
    has_many :sightings
    has_many :birds, through: :sightings
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :age, presence: true

    def self.ornithologist
        where(ornithologist: true)
    end
end
