require 'rails_helper' do


  describe "put a destination route", :type => :request do

    describe do
      @meal = FactoryBot.create(:meal)
    end

    it "retunrs a sucess response" do
      put "/api/v1/meals/#{@meal.id}", params: {:dish => "New Dish"}, headers: {Authorization: 'Basic bmFtZTpwYXNzd29yZA=='}
      expect(response).to have_http_status(200)
    end

  end


end
