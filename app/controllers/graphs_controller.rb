class GraphsController < ApplicationController
  def direction; end

  def shortest_path
    belgium_mapping = Graph.new

    city_connections = []
    City.all.each do |city|
      name = city.name
      connections = city.roads.each_with_object({}) do |road, object|
        object[city == road.city_start ? road.city_end.name : road.city_start.name] = road.distance
      end
      city_connections << [name, connections]
    end

    city_connections.each do |city_connection|
      belgium_mapping.add_vertex(city_connection[0], city_connection[1])
    end
    @path = belgium_mapping.shortest_path(params[:city_start], params[:city_end])
    @path.push(params[:city_start]).reverse!
  end
end
