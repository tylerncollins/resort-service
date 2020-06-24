class ResortResource < ApplicationResource
  attribute :name, :string
  attribute :latitude, :float
  attribute :longitude, :float
  attribute :google_place_id, :string
end
