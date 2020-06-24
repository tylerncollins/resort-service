require 'rails_helper'

RSpec.describe "resorts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/resorts/#{resort.id}", params: params
  end

  describe 'basic fetch' do
    let!(:resort) { create(:resort) }

    it 'works' do
      expect(ResortResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('resorts')
      expect(d.id).to eq(resort.id)
    end
  end
end
