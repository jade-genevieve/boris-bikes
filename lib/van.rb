class Van
  DEFAULT_CAPACITY = 6

  attr_reader :capacity, :bike

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def collect_bikes(location)
    if location.instance_of? DockingStation
      location.broken_bikes.each do |bike|
        @bikes << bike
      end
    elsif location.instance_of? Garage
      location.fixed_bikes.each do |bike|
        @bikes << bike
      end
    end
  end
end
