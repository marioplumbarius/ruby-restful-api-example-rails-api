require "rails_helper"

RSpec.describe DevelopersController, type: :controller do
  describe "POST #create" do
    let(:developer) { nil }
    let(:developer_params) { nil }

    before do
      allow(Developer).to receive(:new).with(developer_params).and_return(developer)
    end

    context "with valid params" do
      let(:developer) { build :developer }
      let(:params) { {name: developer.name, age: developer.age.to_s} }
      let(:developer_params) { ActionController::Parameters.new(params).permit(:name, :age) }

      before do
        allow(developer).to receive(:save).and_return(true)
      end

      it "assigns a new developer as @developer" do
        expect(Developer).to receive(:new).with(developer_params)

        post :create, params: {developer: params}

        expect(assigns(:developer)).to eq developer
      end

      it "tries to save the developer" do
        expect(developer).to receive(:save)

        post :create, params: {developer: params}
      end

      it "renders it" do
        expect_any_instance_of(DevelopersController).to receive(:render).with(json: developer, status: :created, location: developer)

        post :create, params: {developer: params}
      end
    end

    context "with invalid params" do
      let(:developer) { build :developer, :invalid }
      let(:params) { {name: developer.name, age: developer.age.to_s} }
      let(:developer_params) { ActionController::Parameters.new(params).permit(:name, :age) }

      before do
        allow(developer).to receive(:save).and_return(false)
      end

      it "assigns a new developer as @developer" do
        expect(Developer).to receive(:new).with(developer_params)

        post :create, params: {developer: params}

        expect(assigns(:developer)).to eq developer
      end

      it "tries to save the developer" do
        expect(developer).to receive(:save)

        post :create, params: {developer: params}
      end

      it "renders the errors found" do
        expect_any_instance_of(DevelopersController).to receive(:render).with(json: developer.errors, status: :unprocessable_entity)

        post :create, params: {developer: params}
      end
    end
  end

end
