class Api::V1::DijkstrasController < Api::V1::BaseController
  before_action :set_city, only: [:create]

  def create
    if @city_start.country == @city_end.country
      belgium_mapping = DijkstraService.new_graph
      @path, @distance = DijkstraService.path_distance(@city_start.name, @city_end.name, belgium_mapping)
      json_api = DijkstraSerializer.new(@city_start, { params: { path: @path, distance: @distance }}).serializable_hash.to_json
      render json: json_api
    else
      render json: { error: 'Cities must be from the same country' }
    end
  end

  private

  def set_city
    @city_start = City.find(params[:city_start_id])
    @city_end = City.find(params[:city_end_id])
  end
end
