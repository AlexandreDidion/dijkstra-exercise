class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  http_basic_authenticate_with name: ENV['basic_user'], password: ENV['basic_password']
end
