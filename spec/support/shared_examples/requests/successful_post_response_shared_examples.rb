RSpec.shared_examples_for 'successful post response' do
  include_examples 'response with default resource fields'

  it 'returns 201 status code' do
    expect(response).to have_http_status 201
  end
end
