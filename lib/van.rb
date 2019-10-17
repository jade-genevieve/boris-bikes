require_relative "bike"

class Van
  DEFAULT_CAPACITY = 6

  attr_reader :capacity, :bikes

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def collect_bikes(location)
    if location.instance_of? DockingStation
      location.bikes.each do |bike|
        @bikes << bike
        location.bikes.delete_if { |bike| bike.broken == true }
      end
    else
      location.instance_of? Garage
      location.fixed_bikes.each do |bike|
        @bikes << bike
        location.bikes.delete_if { |bike| bike.broken == false }
      end
    end
  end
end
