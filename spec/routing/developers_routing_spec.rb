require 'rails_helper'

RSpec.describe DevelopersController, type: :routing do
  describe 'routing' do
    let(:id){ Faker::Number.digit }

    it 'routes to #index' do
      expect(get: '/developers').to route_to('developers#index')
    end

    it 'routes to #show' do
      expect(get: "/developers/#{id}").to route_to('developers#show', id: id)
    end

    it 'routes to #create' do
      expect(post: '/developers').to route_to('developers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: "/developers/#{id}").to route_to('developers#update', id: id)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/developers/#{id}").to route_to('developers#update', id: id)
    end

    it 'routes to #destroy' do
      expect(delete: "/developers/#{id}").to route_to('developers#destroy', id: id)
    end

  end
end
