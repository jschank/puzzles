# Exception raised when a attempt is made to create an invalid chess piece
class InvalidPieceException < StandardError
  def initialize(args)
    super("Invalid piece exception #{args}")
  end
end
