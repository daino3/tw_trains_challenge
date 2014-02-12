require 'rspec'
require_relative '../models/town'

describe 'Town' do
  let(:town) { Town.new('A', {'B' => 5, 'D' => 5, 'E' => 7})}
  
  it 'should be initialized with a town name (letter)' do
    expect(town.letter).to eq('A')
  end

  it 'should be initialized with adjacent towns with distances' do
    expect(town.adj_towns).to be_an(Hash)
  end

end