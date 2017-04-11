class OrientationManagement

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
