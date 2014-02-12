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

end