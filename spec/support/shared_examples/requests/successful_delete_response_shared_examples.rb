RSpec.shared_examples_for "successful delete response" do
  it "returns 204 status code" do
    expect(response).to have_http_status 204
  end

  it "returns an empty response body" do
    expect(response.body).to be_blank
  end
end
