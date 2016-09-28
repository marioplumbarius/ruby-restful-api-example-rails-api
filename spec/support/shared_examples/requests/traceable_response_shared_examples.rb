RSpec.shared_examples_for 'traceable response' do
  context 'with response headers' do
    it 'returns X-Request-Id' do
      expect(response.headers['X-Request-Id']).not_to be_blank
    end

    it 'returns X-Runtime' do
      expect(response.headers['X-Runtime']).not_to be_blank
    end
  end
end
