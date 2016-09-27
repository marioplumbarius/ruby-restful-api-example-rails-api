require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "GET /developers/:id" do
    let(:id) { "1" }

    context "when the developer exist" do
      let(:valid_params){ {id: id, name: "Mario", age: 26} }

      before do
        Developer.create! valid_params
        get developer_path(id)
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(200)
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

      context "with headers" do
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
    end

    context "when the developer does not exist" do
      let(:id) { "0" }

      it "returns ActiveRecord::RecordNotFound error" do
        expect{
          get developer_path(id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
