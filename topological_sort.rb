=begin
const nodes = [0,1,2,3,4,5,6,7,8,9]

const edges = [
  [1, 0],
  [1, 4],
  [1, 3],
  [4, 5],
  [4, 8],
  [3, 6],
  [3, 7],
  [3, 2],
  [6, 9],
]

@edges
                                          1
                        /                  |            \
                        0                 4             3
                                         / \         /  |  \
                                        5   8       6   7  2
                                                   /
                                                  9

@edges2
                                                  1
                                /                  |            \
                                0                 4    ----     3
                                                 / \         /  |  \
                                                5   8       6   7  2
                                                           /
                                                          9
=end
@nodes = [0,1,2,3,4,5,6,7,8,9]

@edges = [
  [1, 0],
  [1, 4],
  [1, 3],
  [4, 5],
  [4, 8],
  [3, 6],
  [3, 7],
  [3, 2],
  [6, 9],
]

@adjacency_list = Hash.new{|h,k| h[k] = []}

@nodes.each do |node|
  @adjacency_list[node]
end

@edges.each do |p, c|
  @adjacency_list[p] << c
end

puts @adjacency_list.inspect

def topological_sort
  ordering = []
  visited = Hash.new{|h, k| h[k] = false}

  @nodes.each do |n|
    ordering = depth_first_search(n, visited, ordering)
  end
  ordering
end

def depth_first_search(node, visited={}, ordering=[])
  return ordering if visited[node]

  children = @adjacency_list[node]

  #a leaf node
  unless children.length > 0
    ordering.unshift(node)
    visited[node] = true
    return ordering
  end

  while children.length > 0
    child = children.pop
    ordering = depth_first_search(child, visited, ordering)
  end

  visited[node] = true
  ordering = ordering.unshift(node)
  return ordering
end

puts topological_sort.inspect
