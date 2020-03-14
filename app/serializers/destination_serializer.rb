class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description

  has_many :attractions, serializer: AttractionSerializer
end
