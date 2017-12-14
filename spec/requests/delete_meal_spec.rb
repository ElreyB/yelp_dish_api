require 'rails_helper'

describe "delete a meal route", :type => :request do

  before do
    post '/api/v1/meals', params: { :dish => "Test Dish", :drink => "Test Drink", :rating => 5}, headers: {Authorization: ENV['YELP_API_KEY']}
  end

  it "returns success response" do
    id = JSON.parse(response.body)['id']
    delete '/api/v1/meals/id', headers: {Authorization: ENV['YELP_API_KEY']}
    expect(response).to have_http_status(404)
  end

end
