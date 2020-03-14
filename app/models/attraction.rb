class Attraction < ApplicationRecord
    belongs_to :destination
    validates :name, presence: true
end
