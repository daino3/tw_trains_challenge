class Town
  attr_accessor :letter, :adj_towns

  def initialize(letter, adj_towns)
    @letter    = letter
    @adj_towns = adj_towns
  end

  def adjacent_towns
    @adj_towns.keys.compact
  end

end