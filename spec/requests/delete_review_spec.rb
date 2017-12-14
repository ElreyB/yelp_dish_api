require 'rails_helper'

describe "delete a review route" do

  before do
    @meal = FactoryBot.create(:meal)
    @review = FactoryBot.create(:review, meal: @meal)
  end

  it "returns a success code" do
    user_name = @review.author
    delete "/api/v1/meals/#{@meal.id}/reviews/#{@review.id}", params: {:author => user_name}, headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}
    expect(response).to have_http_status(200)

  end

end
