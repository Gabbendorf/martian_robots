class Robot

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


    final_position
  end






  def change_orientation_clockwise(initial_orientation)
    if initial_orientation == 'N'
      return 'E'
    elsif initial_orientation == 'E'
      return 'S'
    elsif initial_orientation == 'S'
      return 'W'
    else
      return 'N'
    end
  end

end
