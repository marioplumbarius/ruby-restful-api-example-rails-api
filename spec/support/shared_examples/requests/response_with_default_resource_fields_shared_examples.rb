RSpec.shared_examples_for 'response with default resource fields' do
  context 'with response body' do
    it 'returns :id field' do
      expect(JSON.parse(response.body)).to include('id')
    end

    it 'returns :created_at field' do
      expect(JSON.parse(response.body)).to include('created_at')
    end

    it 'returns :updated_at field' do
      expect(JSON.parse(response.body)).to include('updated_at')
    end
  end
end
