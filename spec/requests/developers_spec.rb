require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "GET /developers" do

    before do
      get developers_path
    end

    it "returns 'OK' status code" do
      expect(response).to have_http_status(:ok)
    end

    context "with headers" do

      context "with pagination" do
        it "returns X-Pagination-Total" do
          expect(response.headers['X-Pagination-Total']).not_to be_blank
        end

        it "returns X-Pagination-Page" do
          expect(response.headers['X-Pagination-Page']).not_to be_blank
        end

        it "returns X-Pagination-Per-Page" do
          expect(response.headers['X-Pagination-Per-Page']).not_to be_blank
        end
      end

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
      context "when no developer is found" do
        it "returns an empty body" do
          expect(JSON.parse(response.body)).to be_empty
        end
      end

      context "when there are developers found" do
        let(:valid_params) { {name: "Mario Luan", age: 26 } }

        before do
          Developer.create! valid_params

          get developers_path
        end

        it "does not return an empty body" do
          expect(JSON.parse(response.body)).not_to be_empty
        end
      end
    end
  end
end
