require 'rails_helper'

RSpec.describe "resorts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/resorts", params: params
  end

  describe 'basic fetch' do
    let!(:resort1) { create(:resort) }
    let!(:resort2) { create(:resort) }

    it 'works' do
      expect(ResortResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['resorts'])
      expect(d.map(&:id)).to match_array([resort1.id, resort2.id])
    end
  end
end
