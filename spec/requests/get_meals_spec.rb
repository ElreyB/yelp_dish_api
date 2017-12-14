require 'rails_helper'

describe "get all meals route", :type => :request do
  let!(:meals) { FactoryBot.create_list(:meal, 20) }

  before { get '/api/v1/meals', headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}}

  it "returns all meals in one page" do
    expect(JSON.parse(response.body).size).to eq 5
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end
end


describe "returns meal specified by meal id", :type => :request do
  let!(:meals) { FactoryBot.create(:meal) }

  before { get "/api/v1/meals/#{meals.id}", headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}}

  it "returns one meal matching meal id" do
    expect(JSON.parse(response.body).size).to eq 4
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

end
