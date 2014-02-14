require 'rspec'
require 'pry'
require_relative '../models/train_route'
require_relative '../config/route_map'

describe 'TrainRoute' do
  let(:route) { TrainRoute.new(*TRAIN_ROUTE)}
  
  it 'should be initialized with an Array of Towns' do
    expect(route.towns).to be_an(Array) 
    expect(route.towns[0]).to be_an(Town)
  end

  describe '#find_town_by_letter' do
    it 'should return a Town object'do
      expect(route.find_town_by_letter('B')).to be_an(Town)
    end

    it 'should return the correct town' do
      expect(route.find_town_by_letter('B').letter == 'B').to be_true      
    end
  end

  describe '#travel' do 
    it 'adds the distances between nodes' do
      expect(route.travel(*[A, B])).to eq(15)
    end
  end

end