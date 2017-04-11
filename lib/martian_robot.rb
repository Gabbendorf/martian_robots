# require_relative 'orientation_management'

class MartianRobot

  attr_reader :coordinates, :orientation

  def initialize(coordinates, orientation)
    @coordinates = coordinates
    @orientation = orientation
    @orientation_management = OrientationManagement.new
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
        @orientation = @orientation_management.change_orientation_clockwise(@orientation)
      end

      if single_instruction == 'L'
        @orientation = @orientation_management.change_orientation_anticlockwise(@orientation)
      end
    end
    final_position
  end

end
