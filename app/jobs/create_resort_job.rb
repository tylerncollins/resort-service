require 'resort_detail_search_service.rb'

class CreateResortJob < ApplicationJob
  queue_as :default

  def perform(*resort_names)
    resort_details = []
    resort_names.each do |resort_name|
      resort_detail_obj = search_resort_details(resort_name)
      resort_details << resort_detail_obj unless resort_detail_obj.nil?
    end
    resort_details.each do |resort_detail|
      create_resort(resort_detail)
    end
  end

  private 

  def search_resort_details(resort_name)
    ResortDetailSearchService.call(resort_name: resort_name)
  end

  def create_resort(resort_detail)
    Resort.create(
      name: resort_detail.name,
      google_place_id: resort_detail.google_place_id,
      longitude: resort_detail.lng,
      latitude: resort_detail.lat
    )
  end
end
