require 'rails_helper'

RSpec.describe "resorts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/resorts/#{resort.id}", payload
  end

  describe 'basic update' do
    let!(:resort) { create(:resort) }

    let(:payload) do
      {
        data: {
          id: resort.id.to_s,
          type: 'resorts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ResortResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { resort.reload.attributes }
    end
  end
end
