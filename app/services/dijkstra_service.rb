class DijkstraService
  class << self
    def new_graph
      cities_connections = []
      City.all.each do |city|
        name = city.name
        cities_connections = city.connected_roads.each_with_object(cities_connections) do |array, object|
          object << array.unshift(name)
        end
      end

      graph = GraphService.new(cities_connections)
    end

    def path_distance(city_start, city_end, graph)
      shortest_path(city_start, city_end, graph)
    end

    private

    def dijkstra(source, graph)

      return  if graph.dijkstra_source == source
      q = graph.vertices.values
      q.each do |v|
        v.dist = Float::INFINITY
        v.prev = nil
      end
      graph.vertices[source].dist = 0
      until q.empty?
        u = q.min_by {|vertex| vertex.dist}
        break if u.dist == Float::INFINITY
        q.delete(u)
        u.neighbours.each do |v|
          vv = graph.vertices[v]
          if q.include?(vv)
            alt = u.dist + graph.edges[[u.name, v]]
            if alt < vv.dist
              vv.dist = alt
              vv.prev = u.name
            end
          end
        end
      end
      graph.dijkstra_source = source
  end

  def shortest_path(source, target, graph)
    dijkstra(source, graph)
    path = []
    u = target
    while u
      path.unshift(u)
      u = graph.vertices[u].prev
    end
    return path, graph.vertices[target].dist
  end

  end
end
