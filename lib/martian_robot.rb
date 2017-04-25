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
    if lost?(@coordinates)
      last_position_before_lost(@coordinates, @orientation)
    else
      @coordinates
    end
    # lost?(@coordinates) ? :lost : @coordinates
  end

  def last_position_before_lost(position, orientation)
    last_position = [[position[0], position[1]], orientation]
      if position[0] > @planet.size
        last_position[0][0] = @planet.size
      elsif position[1] > @planet.size
        last_position[0][1] = @planet.size
      elsif position[0] < 0
        last_position[0][0] = 0
      else
        last_position[0][1] = 0
      end
    last_position
  end

  private

  def execute(instruction)
    case instruction
    when 'F'
      @movements.move_forward(@orientation, @coordinates)
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
