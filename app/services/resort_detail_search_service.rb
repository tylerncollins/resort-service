require 'places_client.rb'

class ResortDetailSearchService < ApplicationService
  def initialize(resort_name:)
    @resort_name = resort_name
  end

  def call
    resort_query = @resort_name.to_s + " ski resort"
    search_result_obj = search_resort(resort_query).candidates.first
    if search_result_obj
      resort_details = OpenStruct.new(
        :name => search_result_obj.name,
        :google_place_id => search_result_obj.place_id,
        :lng => search_result_obj.geometry.location.lng,
        :lat => search_result_obj.geometry.location.lat
      )
    end
  end

  private

  def search_resort(resort_query)
    parse_json(PlacesClient.search(query: resort_query))
  end

  def parse_json(response)
    JSON.parse(response.to_json.to_s, object_class: OpenStruct)
  end
end

