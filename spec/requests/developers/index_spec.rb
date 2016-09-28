require 'rails_helper'

RSpec.describe 'Developers', type: :request do
  describe 'GET /developers' do

    before do
      get developers_path
    end

    it_behaves_like 'traceable response'
    it_behaves_like 'pageable response'

    it 'returns :json content type' do
      expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status 200
    end

    context 'with params' do
      context 'with :name' do
        context 'when there are developers found' do
          let(:developers){ create_list :developer, Faker::Number.between(1, 3) }
          let(:name) { developers.first.name }
          let(:params){ {name: name} }

          before do
            get developers_path, params: params
          end

          it 'returns the developers with :name' do
            items = JSON.parse response.body

            items.each do |item|
              expect(item['name']).to eq name
            end
          end

        end

        context 'when no developer is found' do
          let(:developers) { create_list :developer, Faker::Number.between(1, 3) }
          let(:name) { Faker::Name.name }
          let(:params){ {name: name} }

          before do
            get developers_path, params: params
          end

          it 'returns an empty body' do
            expect(JSON.parse(response.body)).to be_empty
          end
        end
      end

      context 'with :age' do
        context 'when there are developers found' do
          let(:developers){ create_list :developer, Faker::Number.between(1, 3) }
          let(:age) { developers.first.age }
          let(:params){ {age: age} }

          before do
            get developers_path, params: params
          end

          it 'returns the developers with :age' do
            items = JSON.parse response.body

            items.each do |item|
              expect(item['age']).to eq age
            end
          end

        end

        context 'when no developer is found' do
          let(:developers) { create_list :developer, Faker::Number.between(1, 3) }
          let(:age) { Faker::Number.digit }
          let(:params){ {age: age} }

          before do
            get developers_path, params: params
          end

          it 'returns an empty body' do
            expect(JSON.parse(response.body)).to be_empty
          end
        end
      end
    end

    context 'without params' do
      context 'when no developer is found' do
        before do
          get developers_path
        end

        it 'returns an empty body' do
          expect(JSON.parse(response.body)).to be_empty
        end
      end

      context 'when there are developers found' do
        before do
          create :developer

          get developers_path
        end

        it 'does not return an empty body' do
          expect(JSON.parse(response.body)).not_to be_empty
        end
      end
    end
  end
end
