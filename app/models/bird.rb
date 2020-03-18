class Bird < ApplicationRecord
    has_many :sightings
    has_many :birdwatchers, through: :sightings
    validates :common_name, presence: true, uniqueness: true
    validates :scientific_name, presence: true, uniqueness: true
    validates :conservation_status, presence: true
end
