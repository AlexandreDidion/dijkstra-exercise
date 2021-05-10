module Dijkstras
  class Create
    def self.execute(city_start, city_end)
      belgium_mapping = DijkstraService.new_graph
      DijkstraService.path_distance(city_start.name, city_end.name, belgium_mapping)
    end
  end
end