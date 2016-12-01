class Position
  attr_reader :x_coord, :y_coord, :direction, :arena

  def initialize(arena:, x_coord: 0, y_coord: 0, direction: North)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
    @arena = arena
  end

  def advance
    move_to(@x_coord + @direction::X_DISPLACEMENT, @y_coord + @direction::Y_DISPLACEMENT)
  end

  def left
    @direction = @direction.left
  end

  def right
    @direction = @direction.right
  end

  def to_s
    is_within_arena_bounds? ? "#{@x_coord}, #{@y_coord}, #{@direction}" : 'No position'
  end

  private

  def move_to(x, y)
    return unless within_arena_bounds?(x, y)

    @x_coord = x
    @y_coord = y
  end

  def within_arena_bounds?(x, y)
    if @arena.inbounds?(x, y)
      true
    else
      false
    end
  end

  def is_within_arena_bounds?
    within_arena_bounds?(x_coord, y_coord)
  end
end
