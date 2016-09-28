require 'rails_helper'

RSpec.describe 'Developers', type: :request do
  describe 'POST /developers' do

    context 'with valid params' do
      let(:developer) { build :developer }
      let(:valid_params) { developer.as_json }

      before do
        post developers_path, params: {developer: valid_params}
      end

      it_behaves_like 'traceable response'
      it_behaves_like 'response with default resource fields'

      it 'returns 201 status code' do
        expect(response).to have_http_status 201
      end

      it 'returns :json content type' do
        expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
      end

      it 'creates the developer' do
        expect {
          post developers_path, params: {developer: valid_params}
        }.to change(Developer, :count).by(1)
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

    context 'with invalid params' do
      let(:developer) { build :developer, :invalid }
      let(:invalid_params) { developer.as_json }

      before do
        post developers_path, params: {developer: invalid_params}
      end

      it_behaves_like 'traceable response'

      it 'returns :json content type' do
        expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
      end

      it 'returns 422 status code' do
        expect(response).to have_http_status 422
      end

      it 'does not create the developer' do
        expect {
          post developers_path, params: {developer: invalid_params}
        }.to_not change(Developer, :count)
      end

      context 'with response body' do
        it 'returns the errors' do
          body = JSON.parse response.body

          expect(body['name']).not_to be_blank
          expect(body['age']).not_to be_blank
        end
      end
    end
  end
end
