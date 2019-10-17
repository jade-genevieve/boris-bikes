require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bike
  attr_accessor :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes
    @capacity = capacity
  end

  def dock(bike)
    fail "Docking station full" if full?
    bikes << bike
  end

  def release_bike
    fail "No bikes available" if empty? or bikes.select { |bike| bike.working? }.length == 0
    bikes.each_with_index do |bike, index|
      if bike.working?
        bikes.delete_at(index)
        return bike
      end
    end
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end
end
