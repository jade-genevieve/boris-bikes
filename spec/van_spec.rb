require "van"

describe Van do
  it { is_expected.to be_an_instance_of(Van) }

  # describe "initialization" do
  #   it { is_expected.to respond_to :capacity }
  # end

  # it "can receive an array of bikes" do
  #   van = double(:van, bikes: [1, 2, 3])
  #   allow(van).to receive(:deliver_to_garage) do |garage|
  #     garage.bikes = van.bikes
  #   end
  #   van.deliver_to_garage(subject)
  #   expect(subject.bikes).to eq([1, 2, 3])
  # end
end
