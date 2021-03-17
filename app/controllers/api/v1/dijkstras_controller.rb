class Api::V1::DijkstrasController < Api::V1::BaseController
  before_action :set_city, only: [:create]

  def create
    if @city_start.country == @city_end.country
      belgium_mapping = DijkstraService.new_graph
      rough_path, rough_distance = DijkstraService.path_distance(@city_start.name, @city_end.name, belgium_mapping)
      @path = rough_path.push(@city_start.name).reverse
      @distance = rough_distance.fetch(@city_end.name)
    else
      render json: { error: 'Cities must be from the same country' }
    end
  end

  private

  def set_city
    @city_start = City.find_by(name: params[:city_start])
    @city_end = City.find_by(name: params[:city_end])
  end
end
