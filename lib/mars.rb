class Mars

  attr_reader :size

  def initialize(size)
    raise ArgumentError.new("Size must be a valid number") if size <= 0
    @size = size
  end

end
