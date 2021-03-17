class Api::V1::CitiesController < Api::V1::BaseController
  def index
    @cities = params[:country_id].nil? ? City.all : City.where("country_id = #{params[:country_id]}")
  end
end
