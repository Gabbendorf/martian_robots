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
      # if lost?(@coordinates)
      #   break
      # end
    }
    if lost?(@coordinates)
      stop_or_get_lost
    else
      @coordinates
    end
  end

  def last_position_before_lost
    last_position = [@coordinates[0], @coordinates[1]]
    if @coordinates[0] > @planet.size
      last_position[0] = @planet.size
    elsif @coordinates[1] > @planet.size
      last_position[1] = @planet.size
    elsif @coordinates[0] < 0
      last_position[0] = 0
    else
      last_position[1] = 0
    end
    last_position
  end

  private

  def stop_or_get_lost
    if @planet.scent?(last_position_before_lost)
      last_position_before_lost
    else
      @planet.remember_scent(last_position_before_lost)
      :lost
    end
  end

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
