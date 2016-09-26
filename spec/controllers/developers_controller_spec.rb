require "rails_helper"

RSpec.describe DevelopersController, type: :controller do
  subject { described_class.new }

  let(:valid_attributes) {
    {
      name: "Mario Luan",
      age: 26
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
      age: -26
    }
  }

  let(:valid_session) { {} }

  describe "#index" do
    let(:params){ {page: 1, per_page: 1} }
    let(:developer) { Developer.new valid_attributes }
    let(:developers) { [developer] }
    let(:fetched_developers) { Kaminari.paginate_array(developers).page(params[:page]) }

    before do
      allow(Developer).to receive(:page).and_return(fetched_developers)
      allow(fetched_developers).to receive(:per).and_return(fetched_developers)
    end

    after do
      get :index, params: params, session: valid_session
    end

    it "fetches all developers from :page" do
      expect(Developer).to receive(:page).with(params[:page].to_s)
    end

    it "limits the result with :per_page" do
      expect(fetched_developers).to receive(:per).with(params[:per_page].to_s)
    end

    it "assigns fetched developers to @developers" do
      get :index, params: params, session: valid_session

      expect(assigns(:developers)).to eq developers
    end

    it "paginates the response" do
      expect_any_instance_of(DevelopersController).to receive(:paginate).with(json: developers)
    end
  end

  describe "GET #show" do

    it "assigns the requested developer as @developer" do
      developer = Developer.create! valid_attributes
      get :show, params: {id: developer.to_param}, session: valid_session
      expect(assigns(:developer)).to eq(developer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Developer" do
        expect {
          post :create, params: {developer: valid_attributes}, session: valid_session
        }.to change(Developer, :count).by(1)
      end

      it "assigns a newly created developer as @developer" do
        post :create, params: {developer: valid_attributes}, session: valid_session
        expect(assigns(:developer)).to be_a(Developer)
        expect(assigns(:developer)).to be_persisted
      end

      it "redirects to the created developer" do
        post :create, params: {developer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Developer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved developer as @developer" do
        post :create, params: {developer: invalid_attributes}, session: valid_session
        expect(assigns(:developer)).to be_a_new(Developer)
      end

      it "re-renders the 'new' template" do
        post :create, params: {developer: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested developer" do
        developer = Developer.create! valid_attributes
        put :update, params: {id: developer.to_param, developer: new_attributes}, session: valid_session
        developer.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested developer as @developer" do
        developer = Developer.create! valid_attributes
        put :update, params: {id: developer.to_param, developer: valid_attributes}, session: valid_session
        expect(assigns(:developer)).to eq(developer)
      end

      it "redirects to the developer" do
        developer = Developer.create! valid_attributes
        put :update, params: {id: developer.to_param, developer: valid_attributes}, session: valid_session
        expect(response).to redirect_to(developer)
      end
    end

    context "with invalid params" do
      it "assigns the developer as @developer" do
        developer = Developer.create! valid_attributes
        put :update, params: {id: developer.to_param, developer: invalid_attributes}, session: valid_session
        expect(assigns(:developer)).to eq(developer)
      end

      it "re-renders the 'edit' template" do
        developer = Developer.create! valid_attributes
        put :update, params: {id: developer.to_param, developer: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested developer" do
      developer = Developer.create! valid_attributes
      expect {
        delete :destroy, params: {id: developer.to_param}, session: valid_session
      }.to change(Developer, :count).by(-1)
    end

    it "redirects to the developers list" do
      developer = Developer.create! valid_attributes
      delete :destroy, params: {id: developer.to_param}, session: valid_session
      expect(response).to redirect_to(developers_url)
    end
  end

end
