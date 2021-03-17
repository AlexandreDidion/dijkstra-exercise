class Api::V1::DijkstrasController < Api::V1::BaseController
  def create
    belgium_mapping = DijkstraService.new_graph
    rough_path, rough_distance = DijkstraService.path_distance(params[:city_start], params[:city_end], belgium_mapping)
    @path = rough_path.push(params[:city_start]).reverse
    @distance = rough_distance.fetch(params[:city_end])
  end
end
