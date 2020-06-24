require 'faraday'

class ApiClient
  class << self
    def request(url:)
      response, status = get_json(url: url)
      status == 200 ? response : errors(response)
    end

    private

    def errors(response)
      error = { errors: { status: response["status"], message: response["message"] } }
      response.merge(error)
    end

    def get_json(url:)
      response = Faraday.get(url, {'Accept' => 'application/json'})
      [JSON.parse(response.body), response.status]
    end
  end
end