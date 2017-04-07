class Robot

  attr_reader :coordinates, :orientation

  def initialize(coordinates, orientation)
    @coordinates = coordinates
    @orientation = orientation
  end

  def move(instruction)
    if instruction == 'F'
      if @orientation == 'N'
        [@coordinates[0], (@coordinates[0]+1)]
      else
        [@coordinates[0], @coordinates[0]]
      end
    end
    if instruction == 'R' || instruction == 'L'
      [@coordinates[0], @coordinates[0]]
    end 
  end

end
