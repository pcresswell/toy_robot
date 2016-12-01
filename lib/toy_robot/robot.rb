class Robot
  attr_accessor :position

  def initialize(position: NullPosition.new)
    @position = position
  end

  def place(new_position)
    @position = new_position
  end

  def move
    @position.advance
  end

  def left
    @position.left
  end

  def right
    @position.right
  end

  def report
    puts @position.to_s
  end

  alias advance move
end
