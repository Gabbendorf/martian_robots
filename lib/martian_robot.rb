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
    instruction.split('').each {|single_instruction|
      execute(single_instruction)
      if lost?(@coordinates)
        break
      end
    }
    lost?(@coordinates) ? :lost : @coordinates
  end

  def leave_scent_before_getting_lost(final_position)
    if final_position[0] > @planet.size
      [@planet.size, final_position[1]]
    elsif final_position[1] > @planet.size
      [final_position[0], @planet.size]
    elsif final_position[0] < 0
      [0, final_position[1]]
    else
      [final_position[0], 0]
    end
  end

  private

  def execute(instruction)
    case instruction
    when 'F'
      @coordinates = @movements.move_forward(@orientation, @coordinates)
    when 'R'
      @orientation = @movements.change_orientation_clockwise(@orientation)
    when 'L'
      @orientation = @movements.change_orientation_anticlockwise(@orientation)
    end
  end

  def lost?(position)
    invalid_coordinate?(position[0]) || invalid_coordinate?(position[1])
  end

  def invalid_coordinate?(coordinate)
    coordinate < 0 || coordinate > @planet.size
  end

end
