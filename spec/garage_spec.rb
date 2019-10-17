require "garage"

describe Garage do
  describe "initialization" do
    it { is_expected.to respond_to :capacity }
  end

  it "can receive an array of bikes" do
    van = double(:van, bikes: [1, 2, 3])
    allow(van).to receive(:deliver_to_garage) do |garage|
      garage.bikes = van.bikes
    end
    van.deliver_to_garage(subject)
    expect(subject.bikes).to eq([1, 2, 3])
  end

  it "can fix all broken bikes" do
    garage = Garage.new
    bikes = [Bike.new, Bike.new, Bike.new]
    bikes.each {
      |bike|
      bike.broken = true
      garage.bikes << bike
    }
    garage.fix
    expect(garage.bikes[0].broken).to eq(false)
  end
end
