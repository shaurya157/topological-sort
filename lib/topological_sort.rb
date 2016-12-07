require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Khan
def topological_sort(vertices)
  in_edge_counts = {}
  queue = []

  vertices.each do |v|
    in_edge_counts[v] = v.in_edges.length
    queue << v if v.in_edges.empty?
  end

  sorted_vertices = []

  until queue.empty?
    vertex = queue.shift
    sorted_vertices << vertex

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex

      in_edge_counts[to_vertex] -= 1
      queue << to_vertex if in_edge_counts[to_vertex] == 0
    end
  end

  sorted_vertices
end

# Tarjan
