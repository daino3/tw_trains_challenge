class ShortestPath
  attr_accessor :queue
  attr_reader :route, :final_dist, :start, :finish

  def initialize(route, start, finish = nil)
    @route  = route
    @start  = start
    @finish = finish
    @queue  = build_queue # initial data structure to house all nodes of the route (optimal substructure)
    @final_dist = {}
  end

  def build_queue
    Hash[@route.towns.map do |town| 
      [town.letter, {distance: initial_dist(town), prev_node: nil}] 
    end]
  end

  private

  def initial_dist(town)
    @start.letter == town.letter ? 0 : nil
  end

end