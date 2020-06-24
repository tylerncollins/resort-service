require 'rails_helper'

RSpec.describe "resorts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/resorts/#{resort.id}"
  end

  describe 'basic destroy' do
    let!(:resort) { create(:resort) }

    it 'updates the resource' do
      expect(ResortResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Resort.count }.by(-1)
      expect { resort.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
