require "bike"

describe Bike do
  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it { is_expected.to respond_to :working? }
end
