require_relative 'shortest_path'

class TrainRoute
  attr_reader :towns 

  def initialize(*towns)
    @towns = towns
  end

  def shortest_path(start, destination)
    new_path  = ShortestPath.new(self, start, destination)
    next_room = new_path.find_path
  end

  def find_town_by_letter(letter)
    @towns.find do |town| 
      town.letter == letter
    end
  end

  def travel(*args)
    graph = build_graph(*args)
    stops = graph.keys
    distances = []
    stops.each_with_index do |town, index|
      if index + 1 < stops.length
        next_stop = stops[index+1]
        distances << graph[town][next_stop]
      end
    end
    return 'NO SUCH ROUTE' if distances.include?(nil) 
    distances.inject(:+)
  end

  def shortest_route(start, finish)
    path = ShortestPath.new(self, start, finish)
    path.shortest_distance
  end

  def build_graph(*towns)
    Hash[towns.map do |town| 
      [town.letter, town.adj_towns] 
    end]
  end

end