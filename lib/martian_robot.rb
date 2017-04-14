require_relative 'movements'
require_relative 'mars'

class MartianRobot

  attr_reader :coordinates, :orientation

  def initialize(coordinates, orientation, size)
    @coordinates = coordinates
    @orientation = orientation
    @movements = Movements.new
    @planet = Mars.new(size)
  end

  def report_final_position(instruction)
    final_position = starting_position
    instruction.split('').each do |single_instruction|
      case single_instruction
      when'F'
        @movements.move_forward(@orientation, final_position)
      when 'R'
        @orientation = @movements.change_orientation_clockwise(@orientation)
      when 'L'
        @orientation = @movements.change_orientation_anticlockwise(@orientation)
      end
    end
    is_robot_lost?(final_position) ? :lost : final_position
  end

  def starting_position
    x = @coordinates[0]
    y = @coordinates[1]
    [x,y]
  end

  private

  def is_robot_lost?(final_position)
    is_invalid_coordinate?(final_position[0]) || is_invalid_coordinate?(final_position[1])
  end

  def is_invalid_coordinate?(coordinate)
    coordinate < 0 || coordinate >= @planet.size
  end

end
