class Api::V1::MealsController < ApplicationController
  include Response

  def index
    @meals = Meal.paginate(:page => params[:page], :per_page => 5)
    dish = params[:dish]
    rating = params[:rating]
    drink = params[:drink]
    if dish
      @meals = Meal.search_by_dish(dish)
    end
    if rating
      @meals = Meal.search_by_rating(rating)
    end
    if drink
      @meals = Meal.search_by_drink(drink)
    end
    json_response(@meals)
  end

  def show
    @meal = Meal.find(params[:id])
    json_response(@meal)
  end

  def create
    @meal = Meal.create!(meal_params)
    json_response(@meal, :created)
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update!(meal_params)
      render status: 200, json: {
        message: "Your meal has been updated successfully!"
      }
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    if @meal.destroy!
      render status: 200, json: {
        message: "Your meal has been deleted successfully!"
      }
    end
  end

  private

  def meal_params
    params.permit(:dish, :drink, :rating)
  end
end
