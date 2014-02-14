require 'pry'

class ShortestPath
  attr_accessor :queue
  attr_reader :route, :final_queue, :start, :finish

  def initialize(route, start, finish = nil)
    @route  = route
    @start  = start
    @finish = finish
    @queue  = build_queue # initial data structure to house all nodes of the route (optimal substructure)
    @graph  = build_graph # set up graph to reference nodes / vertices / weights
    @final_queue = {}
  end

  def find_all_distances
    until @queue.empty?
      set_values(find_min_dist)
    end
    @final_queue
  end

  def set_values(minimum)
    @queue.each do |town, dist_data|
      if @queue.count == 1
        @final_queue[town] = @queue.delete(town)
        return @final_queue
      elsif dist_data[:distance] == minimum
        set_adj_town_dist(town)
        @final_queue[town] = @queue.delete(town)
      end
    end
  end

  def set_adj_town_dist(town) 
    @graph[town].each do |adj_town, distance|
      old_dist = @queue[town][:distance]
      new_dist = @graph[town][adj_town]

      if @queue[adj_town] != nil
        @queue[adj_town][:distance]  = old_dist + new_dist
        @queue[adj_town][:prev_node] = town
      end
    end 
  end

  def build_queue
    Hash[@route.towns.map do |town| 
      [town.letter, {distance: initial_dist(town), prev_node: nil}] 
    end]
  end

  def build_graph
    Hash[@route.towns.map do |town| 
      [town.letter, town.adj_towns] 
    end]
  end

  def find_min_dist
    @queue.map do |town_letter, dist_data| 
      dist_data[:distance]
    end.compact.min
  end

  private

  def initial_dist(town)
    @start.letter == town.letter ? 0 : nil
  end

end