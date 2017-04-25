class Mars

  attr_reader :size

  def initialize(size)
    raise ArgumentError.new("Size must be a valid number") if size <= 0
    @size = size
    @scents = []
  end

  def remember_scent(position)
    @scents << position
    @scents
  end

  def scent?(position)
    @scents.include?(position)
  end

end
