require_relative "bike"

class Van
  DEFAULT_CAPACITY = 6

  attr_reader :capacity, :bikes

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def collect_bikes(location, deliver = false)
    if !deliver
      location.bikes.each do |bike|
        @bikes << bike
        location.bikes.delete_if { |bike| bike.broken == !deliver }
      end
    elsif deliver
      @bikes.each { |bike|
        location.bikes << bike
        @bikes = []
      }
    end
  end
end
