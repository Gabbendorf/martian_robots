class MartianRobot

  attr_reader :coordinates, :orientation

  def initialize(coordinates, orientation)
    @coordinates = coordinates
    @orientation = orientation
  end

  def report_final_position(instruction)
    x = @coordinates[0]
    y = @coordinates[1]
    final_position = [x, y]
    array_of_instructions = instruction.split('')
    array_of_instructions.each do |single_instruction|
      if single_instruction == 'F'
        # move_forward(@orientation)
        if @orientation == 'E'
          final_position[0] += 1
        elsif @orientation == 'W'
          final_position[0] -= 1
        elsif @orientation == 'N'
          final_position[1] += 1
        elsif @orientation == 'S'
          final_position[1] -= 1
        end
      end
      if single_instruction == 'R'
        @orientation = change_orientation_clockwise(@orientation)
      end

      if single_instruction == 'L'
        @orientation = change_orientation_anticlockwise(@orientation)
      end
    end
    final_position
  end

  def change_orientation_clockwise(initial_orientation)
    if initial_orientation == 'N'
      'E'
    elsif initial_orientation == 'E'
      'S'
    elsif initial_orientation == 'S'
      'W'
    else
      'N'
    end
  end

  def change_orientation_anticlockwise(initial_orientation)
    if initial_orientation == 'N'
      'W'
    elsif initial_orientation == 'E'
      'N'
    elsif initial_orientation == 'S'
      'E'
    else
      'S'
    end
  end

end
