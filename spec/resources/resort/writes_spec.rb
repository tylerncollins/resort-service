require 'rails_helper'

RSpec.describe ResortResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'resorts',
          attributes: attributes_for(:resort)
        }
      }
    end

    let(:instance) do
      ResortResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Resort.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:resort) { create(:resort) }

    let(:payload) do
      {
        data: {
          id: resort.id.to_s,
          type: 'resorts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ResortResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { resort.reload.updated_at }
      # .and change { resort.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:resort) { create(:resort) }

    let(:instance) do
      ResortResource.find(id: resort.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Resort.count }.by(-1)
    end
  end
end
