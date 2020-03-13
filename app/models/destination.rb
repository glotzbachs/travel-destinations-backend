class Destination < ApplicationRecord
    has_many: attractions
    validates :name, presence: true
end
