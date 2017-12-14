require 'rails_helper'

describe 'put a review route', :type => :request do

  before do
    @meal = FactoryBot.create(:meal)
    @review = FactoryBot.create(:review, meal: @meal)
  end

  it "returns a sucess response" do
    user_name = @review.author
    put "/api/v1/meals/#{@meal.id}/reviews/#{@review.id}", params: {:content => "New Content", :author => user_name}, headers: {Authorization: ENV['YELP_API_KEY']}
    expect(response).to have_http_status(200)
  end

end
