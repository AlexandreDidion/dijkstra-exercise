module Dijkstras
  class Create
    def self.execute
      belgium_mapping = DijkstraService.new_graph
      DijkstraService.path_distance(@city_start.name, @city_end.name, belgium_mapping)
    end
  end
end