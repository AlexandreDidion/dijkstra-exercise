class Api::V1::DijkstrasController < Api::V1::BaseController
  before_action :set_city, only: [:create]

  def create
    if @city_start.country == @city_end.country
      @path, @distance = Dijkstras::Create.execute(@city_start, @city_end)
      json_api = DijkstraSerializer.new(@city_start, { params: { path: @path, distance: @distance, city_start_id: @city_start.id, city_end_id: @city_end.id }}).serializable_hash.to_json
      render json: json_api
    else
      render json: { error: 'Cities must be from the same country' }
    end
  end

  private

  def set_city
    @city_start = City.find(params.dig('data', 'attributes', 'city_start_id'))
    @city_end = City.find(params.dig('data', 'attributes', 'city_end_id' ))
  end
end
