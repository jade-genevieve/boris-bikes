require "garage"

describe Garage do
  describe "initialization" do
    it "has capacity for broken bikes" do
      it { is_expected.to respond_to :capacity }
    end
  end
end
