class Movements

  def change_orientation_clockwise(initial_orientation)
    case initial_orientation
    when 'N'
      'E'
    when'E'
      'S'
    when 'S'
      'W'
    else
      'N'
    end
  end

  def change_orientation_anticlockwise(initial_orientation)
    case initial_orientation
    when 'N'
      'W'
    when 'E'
      'N'
    when 'S'
      'E'
    else
      'S'
    end
  end

  def move_forward(initial_orientation, coordinates)
    case initial_orientation
    when 'E'
      [(coordinates[0] += 1),coordinates[1]]
    when 'W'
      [(coordinates[0] -= 1),coordinates[1]]
    when 'N'
      [coordinates[0],(coordinates[1] += 1)]
    else
      [coordinates[0],(coordinates[1] -= 1)]
    end
  end

end
