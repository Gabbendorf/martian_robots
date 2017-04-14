class Mars

attr_reader :size

  def initialize(size)
    raise ArgumentError.new("Size should be bigger than zero") if size <= 0
    @size = size
  end

end
