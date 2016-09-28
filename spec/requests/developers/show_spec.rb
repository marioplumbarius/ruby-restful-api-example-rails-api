require 'rails_helper'

RSpec.describe 'Developers', type: :request do
  describe 'GET /developers/:id' do

    context 'when the developer exists' do
      let(:developer) { create :developer }

      before do
        get developer_path(developer.id)
      end

      it_behaves_like 'traceable response'
      it_behaves_like 'response with default resource fields'

      it 'returns 200 status code' do
        expect(response).to have_http_status 200
      end

      it 'returns :json content type' do
        expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
      end

      context 'with response body' do

        it 'returns the :name of the developer' do
          expect(JSON.parse(response.body)['name']).to eq developer.name
        end

        it 'returns the :age of the developer' do
          expect(JSON.parse(response.body)['age']).to eq developer.age
        end
      end
    end

    context 'when the developer does not exist' do
      let(:id) { 0 }

      it 'returns ActiveRecord::RecordNotFound error' do
        expect{
          get developer_path(id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
