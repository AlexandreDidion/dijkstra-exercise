require 'priority_queue'

class DijkstraService
  class << self
    def new_graph
      graph = GraphService.new

      city_connections = []
      City.all.each do |city|
        name = city.name
        connections = city.roads.each_with_object({}) do |road, object|
          object[city == road.city_start ? road.city_end.name : road.city_start.name] = road.distance
        end
        city_connections << [name, connections]
      end

      city_connections.each do |city_connection|
        graph.add_vertex(city_connection[0], city_connection[1])
      end
      graph
    end

    def path_distance(city_start, city_end, graph)
      shortest_path(city_start, city_end, graph)
    end

    private

    def shortest_path(start, finish, graph)
      maxint = (2**(0.size * 8 - 2) - 1)
      distances = {} # Distance from start to node
      previous = {} # Previous node in optimal path from source
      nodes = PriorityQueue.new # Priority queue of all nodes in Graph

      graph.vertices.each do |vertex, _value|
        if vertex == start # Set root node as distance of 0
          distances[vertex] = 0
          nodes[vertex] = 0
        else
          distances[vertex] = maxint
          nodes[vertex] = maxint
        end
        previous[vertex] = nil
      end

      while nodes
        smallest = nodes.delete_min_return_key # Vertex in nodes with smallest distance in distances

        if smallest == finish # If the closest node is our target we're done so print the path
          path = []
          while previous[smallest] # Traverse through nodes til we reach the root which is 0
            path.push(smallest)
            smallest = previous[smallest]
          end
          return path, distances
        end

        if distances[smallest] == maxint || smallest.nil? # All remaining vertices are inaccessible from source
          break
        end

        graph.vertices[smallest].each do |neighbor, _value| # Look at all the nodes that this vertex is attached to
          alt = distances[smallest] + graph.vertices[smallest][neighbor] # Alternative path distance
          if alt < distances[neighbor] # If there is a new shortest path update our priority queue (relax)
            distances[neighbor] = alt
            previous[neighbor] = smallest
            nodes[neighbor] = alt
          end
        end
      end
      distances
    end
  end
end
