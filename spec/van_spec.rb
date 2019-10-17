require "van"

describe Van do
  it { is_expected.to be_an_instance_of(Van) }

  describe "initialization" do
    it { is_expected.to respond_to :capacity }
  end

  describe "#collect_bikes" do
    # context "the docking station has broken bikes" do
    #   it "should collect broken bikes" do
    #     broken_bikes = [:bike1, :bike2, :bike3]
    #     mock_dock = instance_double(DockingStation, broken_bikes: broken_bikes)
    #     allow(mock_dock).to receive(:instance_of?).and_return(true)
    #     allow(mock_dock).to receive_message_chain(:bikes, :delete_if)
    #     expect(subject.collect_bikes(mock_dock)).to eq([:bike1, :bike2, :bike3])
    #   end
    # end
    # context "the garage has fixed bikes available" do
    #   it "should collect fixed bikes" do
    #     fixed_bikes = [:bike1, :bike2, :bike3]
    #     mock_garage = instance_double(Garage, fixed_bikes: fixed_bikes)
    #     allow(mock_garage).to receive(:instance_of?).and_return(false)
    #     expect(subject.collect_bikes(mock_garage)).to eq([:bike1, :bike2, :bike3])
    #   end
    # end

    it "should remove the bikes from the location" do
      dock = DockingStation.new
      dock.dock(Bike.new)
      broken_bike = Bike.new
      broken_bike.report_broken
      dock.dock(broken_bike)
      van = Van.new
      van.collect_bikes(dock)
      expect(van.bikes.size).to eq(1)
    end
  end

  #   describe "#deliver_bikes" do
  #     it "should add bikes to the bikes array" do
  #       bikes = [:bike1, :bike2, :bike3]
  #       mock_dock = double(:garage, bikes: broken_bikes)
  #       expect(subject.collect_bikes(mock_dock)).to eq([:bike1, :bike2, :bike3])
  #     end
  #   end

  #   it "can receive an array of bikes" do
  #     van = double(:van, bikes: [1, 2, 3])
  #     allow(van).to receive(:deliver_to_garage) do |garage|
  #       garage.bikes = van.bikes
  #     end
  #     van.deliver_to_garage(subject)
  #     expect(subject.bikes).to eq([1, 2, 3])
  #   end
end
