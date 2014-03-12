require 'priority_queue'


# see http://maxburstein.com/blog/introduction-to-graph-theory-finding-shortest-path/
class Graph
  def initialize
    @vertices = {}
  end

  def add_vertex(name, edges)
    @vertices[name] = edges
  end

  def shortest_path(start, finish)
    maxint = (2**(0.size * 8 -2) -1)
    distances = {}
    previous = {}
    nodes = PriorityQueue.new

    @vertices.each do | vertex, value |
      if vertex == start
        distances[vertex] = 0
        nodes[vertex] = 0
      else
        distances[vertex] = maxint
        nodes[vertex] = maxint
      end
      previous[vertex] = nil
    end

    while nodes
      smallest = nodes.delete_min_return_key

      if smallest == finish
        path = []
        while previous[smallest]
          path.push(smallest)
          smallest = previous[smallest]
        end
        path << start
        return path.reverse
      end

      if smallest == nil or distances[smallest] == maxint
        break
      end

      @vertices[smallest].each do | neighbor, value |
        alt = distances[smallest] + @vertices[smallest][neighbor]
        if alt < distances[neighbor]
          distances[neighbor] = alt
          previous[neighbor] = smallest
          nodes[neighbor] = alt
        end
      end
    end
    distances.inspect
  end


  def to_s
    @vertices.inspect
  end
end
