class Garage
  attr_reader :capacity
  attr_accessor :bikes

  def initialize
    @capacity
    @bikes = []
  end

  def fix
    @bikes.each {
      |bike|
      bike.broken = false
    }
  end
end
