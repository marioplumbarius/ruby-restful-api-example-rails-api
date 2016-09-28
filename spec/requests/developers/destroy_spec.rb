require 'rails_helper'

RSpec.describe 'Developers', type: :request do
  describe 'DELETE /developers/:id' do

    context 'when the developer exists' do
      let(:developer) { create :developer }

      before do
        delete developer_path(developer.id)
      end

      it_behaves_like 'traceable response'
      it_behaves_like 'successful delete response'
    end

    context 'when the developer does not exist' do
      let(:id) { 0 }

      it 'returns ActiveRecord::RecordNotFound error' do
        expect{
          delete developer_path(id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
