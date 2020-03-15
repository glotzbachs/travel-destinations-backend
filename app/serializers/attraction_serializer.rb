class AttractionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :destination_id
end
