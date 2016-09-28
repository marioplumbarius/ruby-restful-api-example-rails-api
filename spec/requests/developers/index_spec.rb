require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "GET /developers" do

    before do
      get developers_path
    end

    it_behaves_like "traceable response"
    it_behaves_like "pageable response"

    it "returns :json content type" do
      expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"
    end

    it "returns 200 status code" do
      expect(response).to have_http_status 200
    end

    context "with response body" do
      context "when no developer is found" do
        it "returns an empty body" do
          expect(JSON.parse(response.body)).to be_empty
        end
      end

      context "when there are developers found" do
        before do
          create :developer

          get developers_path
        end

        it "does not return an empty body" do
          expect(JSON.parse(response.body)).not_to be_empty
        end
      end
    end
  end
end
