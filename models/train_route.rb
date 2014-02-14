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
    build_graph(*args).each do |start, travel_options|
      binding.pry
    end
  end

  def build_graph(*towns)
    Hash[towns.map do |town| 
      [town.letter, town.adj_towns] 
    end]
  end

end