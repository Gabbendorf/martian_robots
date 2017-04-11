class MartianRobot

  attr_reader :coordinates, :orientation

  def initialize(coordinates, orientation)
    @coordinates = coordinates
    @orientation = orientation
    @movements = Movements.new
  end

  def report_final_position(instruction)
    x = @coordinates[0]
    y = @coordinates[1]
    final_position = [x, y]
    instruction.split('').each do |single_instruction|
      if single_instruction == 'F'
        @movements.move_forward(@orientation, final_position)
      elsif single_instruction == 'R'
        @orientation = @movements.change_orientation_clockwise(@orientation)
      elsif single_instruction == 'L'
        @orientation = @movements.change_orientation_anticlockwise(@orientation)
      end
    end
    final_position
  end

end
