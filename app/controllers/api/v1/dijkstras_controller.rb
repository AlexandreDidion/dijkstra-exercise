class Api::V1::DijkstrasController < Api::V1::BaseController
  before_action :set_city, only: [:create]

  def create
    if @city_start.country == @city_end.country
      path, distance = Dijkstras::Create.execute(@city_start, @city_end)
      path = build_journey(path)
      json_api = DijkstraSerializer.new(@city_start, { params:
      {
        path: path,
        distance: distance,
        city_start_id: @city_start.id,
        city_end_id: @city_end.id
      } }).serializable_hash.to_json
      render json: json_api
    else
      render json: { error: 'Cities must be from the same country' }
    end
  end

  private

  def build_journey(path)
    path.each_with_object([]) do |city_name, array|
      city = City.find_by(name: city_name)
      array << { city_name: city_name, longitude: city.longitude, latitude: city.longitude, id: city.id }
    end
  end

  def set_city
    @city_start = City.find(params.dig('data', 'attributes', 'city_start_id') || params['city_start_id'])
    @city_end = City.find(params.dig('data', 'attributes', 'city_end_id') || params['city_end_id'])
  end
end
