class PlaceCommand
  def initialize(robot:, command:, arena:)
    @robot = robot
    @params = command[/\s.*/].delete(" ").split(",")
    @arena = arena
  end

  def execute
    @robot.place Position.new(arena: @arena,
                              x_coord: x_coord,
                              y_coord: y_coord,
                              direction: direction)
  end

  private

  def x_coord
    @params[0].to_i
  end

  def y_coord
    @params[1].to_i
  end

  def direction
    case @params[2]
      when "n", "north" then
        North
      when "e", "east" then
        East
      when "s", "south" then
        South
      when "w", "west" then
        West
    end
  end
end

class MoveCommand
  def initialize(robot:)
    @robot = robot
  end

  def execute
    @robot.advance
  end
end

class LeftCommand
  def initialize(robot:)
    @robot = robot
  end

  def execute
    @robot.left
  end
end

class RightCommand
  def initialize(robot:)
    @robot = robot
  end

  def execute
    @robot.right
  end
end

class ReportCommand
  def initialize(robot:)
    @robot = robot
  end

  def execute
    @robot.report
  end
end

class InvalidCommand
  def execute
    puts "Invalid command"
  end
end
