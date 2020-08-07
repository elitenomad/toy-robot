require 'spec_helper'

RSpec.describe Toy::Robot do
  it "has a version number" do
    expect(Toy::Robot::VERSION).not_to be nil
  end
end
