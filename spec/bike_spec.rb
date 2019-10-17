require "bike"

describe Bike do
  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it { is_expected.to respond_to :working? }

  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.
  it "can be reported broken" do
    subject.report_broken
    expect(subject.broken).to be(true)
  end
end
