class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  http_basic_authenticate_with name: ENV['BASIC_USER'], password: ENV['BASIC_PASSWORD']
end
