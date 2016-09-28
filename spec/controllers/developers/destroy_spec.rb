require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do

  describe 'DELETE #destroy' do
    let(:developer){ create :developer }
    let(:id){ developer.id.to_s }
    let(:params) { {id: id} }

    before do
      allow(Developer).to receive(:find).with(id).and_return(developer)
    end

    it 'destroys the requested developer' do
      expect(developer).to receive(:destroy)
      delete :destroy, params: params
    end
  end

end
