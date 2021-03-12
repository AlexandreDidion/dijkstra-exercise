class GraphService
  attr_reader :vertices

  def initialize
    @vertices = {}
  end

  def add_vertex(name, edges)
    @vertices[name] = edges
  end

  def to_s
    @vertices.inspect
  end
end
