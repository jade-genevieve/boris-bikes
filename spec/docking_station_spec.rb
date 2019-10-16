require "docking_station"

describe DockingStation do
  # As a system maintainer,
  # So that busy areas can be served more effectively,
  # I want to be able to specify a larger capacity when necessary.
  describe "initialization" do
    it "has a variable capacity" do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect { docking_station.dock Bike.new }.to raise_error "Docking station full"
    end
  end

  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.
  describe "#release_bike" do
    it { is_expected.to respond_to :release_bike }

    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      # test bike released is same as one just docked
      expect(subject.release_bike).to eq bike
    end

    # As a person,
    # So that I can use a good bike,
    # I'd like to see if a bike is working
    it "releases working bikes" do
      bike = Bike.new
      result = subject.dock(bike)
      expect(result[0]).to be_working
    end

    # As a member of the public,
    # So that I am not confused and charged unnecessarily,
    # I'd like docking stations not to release bikes when there are none available.
    it "raises an error when there are no bikes available" do
      # calling release on empty dock
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe "#dock" do
    # As a member of the public
    # So I can return bikes I've hired
    # I want to dock my bike at the docking station
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks something" do
      bike = Bike.new
      # return the same bike we dock
      expect(subject.dock(bike)).to include(bike)
    end

    # As a member of the public
    # So I can decide whether to use the docking station
    # I want to see a bike that has been docked
    it { is_expected.to respond_to(:bike) }

    # As a maintainer of the system,
    # So that I can control the distribution of bikes,
    # I'd like docking stations not to accept more bikes than their capacity.
    it "raises an error when full" do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end

    # As a system maintainer,
    # So that busy areas can be served more effectively,
    # I want to be able to specify a larger capacity when necessary.
    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
