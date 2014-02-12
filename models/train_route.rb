require_relative 'shortest_path'

class TrainRoute
  attr_reader :towns 

  def initialize(*towns)
    @towns = towns
  end

  def find_town_by_letter(letter)
    @towns.find do |town| 
      town.letter == letter
    end
  end

end