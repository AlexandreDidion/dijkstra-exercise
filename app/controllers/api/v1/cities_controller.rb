class Api::V1::CitiesController < Api::V1::BaseController
  def index
    @cities = params[:country_id].nil? ? City.all : City.where("country_id = #{params[:country_id]}")
    options_api = {}
    options_api[:meta] = { total: @cities.count }
    render_json(@cities, options_api)
  end

  def show
    @city = City.find(params[:id])
    render_json(@city)
  end

  private 

  def render_json(cities, options_api = {})
    json_api = CitySerializer.new(cities, options_api).serializable_hash.to_json
    render json: json_api
  end
end
