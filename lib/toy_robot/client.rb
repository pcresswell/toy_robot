class Client
  def initialize
    @arena = Arena.new width: 5, height: 5
    @robot = Robot.new
  end

  def parse(input)
    command = case input
              when /place\s+(\d+,\s*){2}([nesw]|(north)|(east)|(south)|(west))$/
                PlaceCommand.new robot: @robot, command: input, arena: @arena
              when "move"
                MoveCommand.new robot: @robot
              when "left"
                LeftCommand.new robot: @robot
              when "right"
                RightCommand.new robot: @robot
              when "report"
                ReportCommand.new robot: @robot
              else
                InvalidCommand.new
              end
    command.execute
  end
end
