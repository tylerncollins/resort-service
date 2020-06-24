require 'rails_helper'

RSpec.describe "resorts#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/resorts", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:resort)
    end
    let(:payload) do
      {
        data: {
          type: 'resorts',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ResortResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Resort.count }.by(1)
    end
  end
end
