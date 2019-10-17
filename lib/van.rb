class Van
  DEFAULT_CAPACITY = 6

  attr_reader :capacity, :bike

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end
end
