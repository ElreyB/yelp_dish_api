require 'rails_helper'

  describe "post a meal route", :type => :request do

    it "returns error response when fields are left blank" do
      post '/api/v1/meals', params: { dish: "", drink: "", rating: nil}, headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}
      expect(response).to have_http_status(422)
    end

    before do
      post '/api/v1/meals', params: { :dish => "Test Dish", :drink => "Test Drink", :rating => 5}, headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}
    end

    it "returns the meal's dish" do
      expect(JSON.parse(response.body)['dish']).to eq 'Test Dish'
    end

    it "returns the meal's drink " do
      expect(JSON.parse(response.body)['drink']).to eq 'Test Drink'
    end

    it "returns the meal's rating " do
      expect(JSON.parse(response.body)['rating']).to eq 5
    end

    it "returns a created status" do
      expect(response).to have_http_status(:created)
    end

end
