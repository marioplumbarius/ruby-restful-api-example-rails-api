require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "DELETE /developers/:id" do

    context "when the developer exists" do
      let(:developer) { create :developer }

      before do
        delete developer_path(developer.id)
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(204)
      end

      it "returns an empty response body" do
        expect(response.body).to be_blank
      end

      context "with headers" do
        it "returns X-Request-Id" do
          expect(response.headers['X-Request-Id']).not_to be_blank
        end

        it "returns X-Runtime" do
          expect(response.headers['X-Runtime']).not_to be_blank
        end

        it "does not return a Content-Type" do
          expect(response.headers['Content-Type']).to be_blank
        end
      end
    end

    context "when the developer does not exist" do
      let(:id) { 0 }

      it "returns ActiveRecord::RecordNotFound error" do
        expect{
          delete developer_path(id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
