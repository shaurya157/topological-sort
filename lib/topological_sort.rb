require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Khan
def topological_sort(vertices)
  in_edge_counts = {}
  queue = []
  sorted = []

  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
    in_edge_counts[vertex] = vertex.in_edges.length
  end

  until queue.empty?
    vertex = queue.shift
    sorted << vertex

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex

      in_edge_counts[to_vertex] -= 1
      queue << to_vertex if in_edge_counts[to_vertex] == 0
    end
  end

  sorted
end

# Tarjan

def topological_sort_tarjan(vertices)
  ordering = []
  explored = Set.new

  vertices.each do |vertex|
    dfs!(vertex, explored, ordering) unless explored.include?(vertex)
  end

  ordering
end

def dfs!(vertex, explored, ordering)
  explored.add(vertex)

  vertex.out_edges.each do |edge|
    v = edge.to_vertex
    dfs!(v, explored, ordering) unless explored.include?(v)
  end

  ordering.unshift(vertex)
end
