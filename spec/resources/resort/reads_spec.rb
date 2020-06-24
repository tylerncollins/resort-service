require 'rails_helper'

RSpec.describe ResortResource, type: :resource do
  describe 'serialization' do
    let!(:resort) { create(:resort) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(resort.id)
      expect(data.jsonapi_type).to eq('resorts')
    end
  end

  describe 'filtering' do
    let!(:resort1) { create(:resort) }
    let!(:resort2) { create(:resort) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: resort2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([resort2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:resort1) { create(:resort) }
      let!(:resort2) { create(:resort) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            resort1.id,
            resort2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            resort2.id,
            resort1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
