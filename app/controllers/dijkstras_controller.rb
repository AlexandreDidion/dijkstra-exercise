class DijkstrasController < ApplicationController
  before_action :set_city, only: [:show]

  def show
    if @city_start.country == @city_end.country
      belgium_mapping = DijkstraService.new_graph
      rough_path, rough_distance = DijkstraService.path_distance(@city_start.name, @city_end.name, belgium_mapping)
      @path = rough_path.push(@city_start.name).reverse
      @distance = rough_distance.fetch(@city_end.name)
    else
      render :error
    end
  end

  private

  def set_city
    @city_start = City.find(params[:city_start_id])
    @city_end = City.find(params[:city_end_id])
  end
end
