require "garage"

describe Garage do
  describe "initialization" do
    it { is_expected.to respond_to :capacity }
  end
end
