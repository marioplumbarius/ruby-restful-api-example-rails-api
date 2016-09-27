require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "POST /developers" do

    context "with valid params" do
      let(:valid_params) { { name: "Mario Luan", age: "26" } }

      before do
        post developers_path, params: {developer: valid_params}
      end

      it "returns 201 status code" do
        expect(response).to have_http_status 201
      end

      context "with response headers" do
        it "returns X-Request-Id" do
          expect(response.headers['X-Request-Id']).not_to be_blank
        end

        it "returns X-Runtime" do
          expect(response.headers['X-Runtime']).not_to be_blank
        end

        it "returns Content-Type" do
          expect(response.headers['Content-Type']).not_to be_blank
        end
      end

      context "with response body" do

        it "returns the :name of the developer" do
          expect(JSON.parse(response.body)).to include("name")
        end

        it "returns the :age of the developer" do
          expect(JSON.parse(response.body)).to include("age")
        end

        it "returns the :id of the developer" do
          expect(JSON.parse(response.body)).to include("id")
        end

        it "returns the date the developer was created" do
          expect(JSON.parse(response.body)).to include("created_at")
        end

        it "returns the date the developer was updated" do
          expect(JSON.parse(response.body)).to include("updated_at")
        end
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { name: "", age: "-26" } }

      before do
        post developers_path, params: {developer: invalid_params}
      end

      it "returns 422 status code" do
        expect(response).to have_http_status 422
      end

      context "with response headers" do
        it "returns X-Request-Id" do
          expect(response.headers['X-Request-Id']).not_to be_blank
        end

        it "returns X-Runtime" do
          expect(response.headers['X-Runtime']).not_to be_blank
        end

        it "returns Content-Type" do
          expect(response.headers['Content-Type']).not_to be_blank
        end
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
end
