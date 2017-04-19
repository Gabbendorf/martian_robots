require_relative 'movements'
require_relative 'mars'

class MartianRobot

  attr_reader :coordinates, :orientation

  def initialize(coordinates, orientation, planet)
    @coordinates = coordinates
    @orientation = orientation
    @movements = Movements.new
    @planet = planet
  end

  def report_final_position(instruction)
    final_position = starting_position
    instruction.split('').each {|single_instruction| execute(single_instruction, final_position)}
    lost?(final_position) ? :lost : final_position
  end


  def starting_position
    x = @coordinates[0]
    y = @coordinates[1]
    [x,y]
  end

  private

  def execute(instruction, position)
    case instruction
    when 'F'
      @movements.move_forward(@orientation, position)
    when 'R'
      @orientation = @movements.change_orientation_clockwise(@orientation)
    when 'L'
      @orientation = @movements.change_orientation_anticlockwise(@orientation)
    end
  end

  def lost?(final_position)
    invalid_coordinate?(final_position[0]) || invalid_coordinate?(final_position[1])
  end

  def invalid_coordinate?(coordinate)
    coordinate < 0 || coordinate >= @planet.size
  end

end
