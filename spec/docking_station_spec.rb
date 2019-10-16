require "docking_station"

describe DockingStation do
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
      expect(result).to be_working
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
      expect(subject.dock(bike)).to eq bike
    end

    # As a member of the public
    # So I can decide whether to use the docking station
    # I want to see a bike that has been docked
    it { is_expected.to respond_to(:bike) }
  end
end
