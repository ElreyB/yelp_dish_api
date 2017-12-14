require 'rails_helper'

describe "get all reviews from single meal" do
  let!(:meals) { FactoryBot.create(:meal) }
  let!(:reviews) { FactoryBot.create_list(:review, 20, meal: meals) }

  before { get "/api/v1/meals/#{meals.id}/reviews", headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}}

  it 'returns all reviews for a meal' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "get single review from single meal" do
  let!(:meals) { FactoryBot.create(:meal) }
  let!(:reviews) { FactoryBot.create(:review, meal: meals) }

  before { get "/api/v1/meals/#{meals.id}/reviews/#{reviews.id}", headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}}

  it 'returns one reviews for one meal' do
    expect(JSON.parse(response.body).size).to eq 4
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end


end
