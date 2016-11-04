class Piece
  attr_reader :color, :pos
  def initialize(argv={})
    @color = argv[:color]
    @pos = argv[:pos]
    @king = argv[:king]
  end
end
