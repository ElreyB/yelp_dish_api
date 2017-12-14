class Api::V1::ReviewsController <  ApplicationController
  include Response

  def index
    @reviews = Review.all
    meal = params[:meal_id]
    author = params[:author]
    if meal
      @reviews = Review.reviews(meal)
    end
    if author
      @reviews = Review.by_author(author)
    end
    json_response(@reviews)
  end

  def show
    @meal = Meal.find(params[:meal_id])
    @review = @meal.reviews.find(params[:id])
    json_response(@review)
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @review = @meal.reviews.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @meal = Meal.find(params[:meal_id])
    @review = @meal.reviews.find(params[:id])
    user_name = @review.author
    # This should correlate with current user of app
    author = params[:author]
    if author == user_name
      if @review.update!(review_params)
        render status: 200, json: {
          message: "Your review has been updated successfully!"
        }
      end
    else
      render status: 404, json: {
        message: "You are not authorized to do this."
      }
    end
  end

  def destroy
    @meal = Meal.find(params[:meal_id])
    @review = @meal.reviews.find(params[:id])
    user_name = @review.author
    # This should correlate with current user of app
    author = params[:author]
    if author == user_name
      if @review.destroy!
        render status: 200, json: {
          message: "Your review has been deleted successfully!"
        }
      end
    else
      render status: 404, json: {
        message: "You are not authorized to do this."
      }
    end
  end

private

  def review_params
    params.permit(:author, :content)
  end

end
