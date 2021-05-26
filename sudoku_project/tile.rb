class Tile
  attr_reader :value, :given

  def initialize(value)
    @value = value.to_i
    @given = value.to_i.positive?
  end
end
