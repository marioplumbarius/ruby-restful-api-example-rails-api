require "rails_helper"

RSpec.describe DevelopersController, type: :controller do
  describe "GET #index" do
    let(:developers) { build_list :developer, Faker::Number.digit.to_i }
    let(:params) { nil }

    before do
      allow(Developer).to receive(:where).and_return(developers)
    end

    it "assigns fetched developers to @developers" do
      get :index, params: params

      expect(assigns(:developers)).to eq developers
    end

    it "paginates the result" do
      expect_any_instance_of(DevelopersController).to receive(:paginate).with(json: developers)

      get :index, params: params
    end

    context "when search_params are provided" do
      context "with :name" do
        let(:name) { Faker::Name.name }
        let(:params) { {name: name} }
        let(:search_params) { ActionController::Parameters.new(params).permit(:name, :age) }

        before do
          allow(Developer).to receive(:where).with(search_params).and_return(developers)
        end

        it "filters developers by :name" do
          expect(Developer).to receive(:where).with(search_params)

          get :index, params: params
        end
      end

      context "with :age" do
        let(:age) { Faker::Number.digit }
        let(:params) { {age: age} }
        let(:search_params) { ActionController::Parameters.new(params).permit(:name, :age) }

        before do
          allow(Developer).to receive(:where).with(search_params).and_return(developers)
        end

        it "filters developers by :age" do
          expect(Developer).to receive(:where).with(search_params)

          get :index, params: params
        end
      end
    end

    context "when search_params are not provided" do
      let(:params) { {} }
      let(:search_params) { ActionController::Parameters.new(params).permit(:name, :age) }

      before do
        allow(Developer).to receive(:where).with(search_params).and_return(developers)
      end

      it "fetches all developers" do
        expect(Developer).to receive(:where).with(search_params)

        get :index, params: params
      end
    end
  end
end
