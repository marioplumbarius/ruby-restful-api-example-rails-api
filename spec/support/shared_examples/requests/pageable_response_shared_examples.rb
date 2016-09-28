RSpec.shared_examples_for 'pageable response' do
  context 'with headers' do
    context 'with pagination' do
      it 'returns X-Pagination-Total' do
        expect(response.headers['X-Pagination-Total']).not_to be_blank
      end

      it 'returns X-Pagination-Page' do
        expect(response.headers['X-Pagination-Page']).not_to be_blank
      end

      it 'returns X-Pagination-Per-Page' do
        expect(response.headers['X-Pagination-Per-Page']).not_to be_blank
      end
    end
  end
end
