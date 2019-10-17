class Van
  DEFAULT_CAPACITY = 6

  attr_reader :capacity, :bike

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def collect_bikes(location)
    location.bikes.each do |bike|
      @bikes << bike
    end
  end
end
