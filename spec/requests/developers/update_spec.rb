require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "PATCH /developers/:id" do

    context "when the developer exists" do
      let(:fake_developer) { build :developer }
      let(:developer){ Developer.create! name: fake_developer.name, age: fake_developer.age }

      context "with valid params" do
        let(:new_fake_developer) { build :developer }
        let(:valid_params) { { name: new_fake_developer.name, age: new_fake_developer.age } }

        before do
          patch developer_path(developer.id), params: {developer: valid_params}
        end

        it_behaves_like "traceable response"
        it_behaves_like "response with default resource fields"

        it "returns 200 status code" do
          expect(response).to have_http_status 200
        end

        it "updates the developer" do
          developer.reload
          expect(developer.name).to eq valid_params[:name]
          expect(developer.age).to eq valid_params[:age]
        end

        it "returns :json content type" do
          expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"
        end

        context "with response body" do

          it "returns the :name of the developer" do
            expect(JSON.parse(response.body)['name']).to eq valid_params[:name]
          end

          it "returns the :age of the developer" do
            expect(JSON.parse(response.body)['age']).to eq valid_params[:age]
          end

          it "returns the :id of the developer" do
            expect(JSON.parse(response.body)['id']).to eq developer.id
          end
        end
      end

      context "with invalid params" do
        let(:new_fake_developer) { build :developer, :invalid }
        let(:invalid_params) { { name: new_fake_developer.name, age: new_fake_developer.age } }

        before do
          patch developer_path(developer.id), params: {developer: invalid_params}
        end

        it_behaves_like "traceable response"

        it "returns 422 status code" do
          expect(response).to have_http_status 422
        end

        it "returns :json content type" do
          expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"
        end

        it "does not update the developer" do
          developer.reload

          expect(developer.name).not_to eq invalid_params[:name]
          expect(developer.age).not_to eq invalid_params[:age]
        end

        context "with response body" do
          it "returns the errors" do
            body = JSON.parse response.body

            expect(body['name']).not_to be_blank
            expect(body['age']).not_to be_blank
          end
        end
      end

    end

    context "when the developer does not exist" do
      let(:id) { Faker::Number.digit }

      it "returns ActiveRecord::RecordNotFound error" do
        expect {
          patch developer_path(id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
