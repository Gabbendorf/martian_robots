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
      if single_instruction == 'F'
        @movements.move_forward(@orientation, final_position)
      elsif single_instruction == 'R'
        @orientation = @movements.change_orientation_clockwise(@orientation)
      elsif single_instruction == 'L'
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
    final_position[0] >= @planet.length || final_position[1] >= @planet.height
  end

end
