require 'rspec'
require 'pry'
require_relative '../models/shortest_path'
require_relative '../config/route_map'

describe 'ShortestPath' do
  let(:test_route) { TrainRoute.new(*TRAIN_ROUTE)}
  let(:shortest) { ShortestPath.new(test_route, TEST_TOWN)}
  
  it 'should be initialized with a route' do
    expect(shortest.route).to be_an(TrainRoute)
  end

  it 'should be initialized with a starting town and an optional destination' do
    expect(shortest.start).to be_an(Town)
  end

  describe '#build_queue' do
    it 'should create a hash with keys as town letters' do
      alpha = ('A'..'Z').to_a
      towns = shortest.queue.keys
      expect(towns.all? {|town_letter| alpha.include?(town_letter)}).to be_true
    end

    it 'should create a hash with values as town distance hashes' do
      town_distances = shortest.queue.values
      expect(town_distances.all? {|distance| distance.instance_of?(Hash) }).to be_true
    end

    it 'should set the starting town in the queue to have a distance of 0' do
      starting_town = shortest.start.letter
      expect(shortest.queue[starting_town][:distance]).to eq(0)
    end
  end

  describe '#find_min_dist' do
    it 'should return the least non-nil distance value of the queue' do
      expect(shortest.find_min_dist).to eq(0)
    end
  end

  describe '#find_all_distances' do
    it 'should set the distances of the adjacent towns' do
      shortest.find_all_distances
      distances = shortest.final_queue.values.map { |dist_data| dist_data[:distance] }
      expect(distances.all? {|element| element.is_a?(Integer)}).to be_true
    end

    it 'returns shortest possible distances' do
      shortest.find_all_distances
      distances = shortest.final_queue.values.map { |dist_data| dist_data[:distance] }
      expect(distances.all? {|element| element.is_a?(Integer)}).to be_true
    end
  end


end