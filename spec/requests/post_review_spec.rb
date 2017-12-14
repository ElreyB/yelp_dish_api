require 'rails_helper'

describe "post a review route" do
  let!(:meal) { FactoryBot.create(:meal) }

  before do
    post "/api/v1/meals/#{meal.id}/reviews", params: { author: 'Test Author', content: "Test Content"}, headers: {Authorization: ENV['YELP_API_KEY']}
  end

  it 'returns the review author' do
    expect(JSON.parse(response.body)['author']).to eq 'Test Author'
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end

end
