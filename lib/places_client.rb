require 'api_client.rb'

class PlacesClient
  class << self
    KEY = ENV['GOOGLE_CLOUD_API_KEY']
    BASE = "https://maps.googleapis.com/maps/api/place".freeze

    def search(query:)
      str = query.to_s
      query_str = URI::encode(str)
      path = "findplacefromtext/json?input=#{query_str}&inputtype=textquery&fields=name,place_id,geometry/location"
      get(path: path)
    end

    private

    def get(path:)
      url = "#{BASE}/#{path}&key=#{KEY}"
      ApiClient.request(url: url)
    end
  end
end