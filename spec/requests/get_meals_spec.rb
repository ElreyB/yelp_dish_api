require 'rails_helper'

describe "get all meals route", :type => :request do
  let!(:meals) { FactoryBot.create_list(:meal, 20) }

  before { get '/api/v1/meals' }

  it "returns all meals in one page" do
    expect(JSON.parse(response.body).size).to eq 5
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

end
