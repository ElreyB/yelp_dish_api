class ApplicationController < ActionController::API
  # For Basic Authentication
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include Response
  http_basic_authenticate_with name: "name", password: "password", except: :index

  def index
    render plain: "Everyone can see me!"
  end

  def edit
    render plain: "I'm only accessible if you know the super secret password."
  end
  # End

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

end
