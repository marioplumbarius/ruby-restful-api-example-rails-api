require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  describe 'PUT #update' do
    let(:id) { Faker::Number.digit }
    let(:params) { nil }
    let(:developer) { nil }
    let(:developer_params) { nil }

    before do
      allow(Developer).to receive(:find).with(id).and_return(developer)
    end

    context 'with valid params' do
      let(:developer) { build :developer }
      let(:params){ {name: developer.name, age: developer.age.to_s} }
      let(:developer_params) { ActionController::Parameters.new(params).permit(:name, :age) }

      before do
        allow(developer).to receive(:update).with(developer_params).and_return(true)
      end

      it 'assigns the requested developer as @developer' do
        put :update, params: {id: id, developer: params}
        expect(assigns(:developer)).to eq(developer)
      end

      it 'tries to update the requested developer' do
        expect(developer).to receive(:update).with(developer_params)
        put :update, params: {id: id, developer: params}
      end

      it 'renders the developer' do
        expect_any_instance_of(DevelopersController).to receive(:render).with(json: developer)
        put :update, params: {id: id, developer: params}
      end
    end

    context 'with invalid params' do
      let(:developer) { build :developer, :invalid }
      let(:params){ {name: developer.name, age: developer.age.to_s} }
      let(:developer_params) { ActionController::Parameters.new(params).permit(:name, :age) }

      before do
        allow(developer).to receive(:update).with(developer_params).and_return(false)
      end

      it 'assigns the requested developer as @developer' do
        put :update, params: {id: id, developer: params}
        expect(assigns(:developer)).to eq(developer)
      end

      it 'tries to update the requested developer' do
        expect(developer).to receive(:update).with(developer_params)
        put :update, params: {id: id, developer: params}
      end

      it 'renders the errors found' do
        expect_any_instance_of(DevelopersController).to receive(:render).with(json: developer.errors, status: :unprocessable_entity)
        put :update, params: {id: id, developer: params}
      end
    end
  end
end
