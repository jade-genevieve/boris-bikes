require "van"

describe Van do
  it { is_expected.to be_an_instance_of(Van) }

  describe "initialization" do
    it { is_expected.to respond_to :capacity }
  end

  describe "#collect_bikes" do
    it "should store broken bikes for transporting" do
      broken_bikes = [:bike1, :bike2, :bike3]
      mock_dock = double(:docking_station, bikes: broken_bikes)
      expect(subject.collect_bikes(mock_dock)).to eq([:bike1, :bike2, :bike3])
    end
  end

  #   it "can receive an array of bikes" do
  #     van = double(:van, bikes: [1, 2, 3])
  #     allow(van).to receive(:deliver_to_garage) do |garage|
  #       garage.bikes = van.bikes
  #     end
  #     van.deliver_to_garage(subject)
  #     expect(subject.bikes).to eq([1, 2, 3])
  #   end
end
