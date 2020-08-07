require 'spec_helper'

module Toy
    module Robot
        RSpec.describe Grid do
            subject { Toy::Robot::Grid.new(6,6)}
          
            context "#valid_location?" do
                describe 'for valid robot placements' do
                    it 'is expected to return truthy based on co-ordinates' do
                        expect(subject.valid_location?(0,0)).to be_truthy
                        expect(subject.valid_location?(1,2)).to be_truthy
                    end
                end
                describe 'for invalid robot placements' do
                    it 'is expected to return falsey based on co-ordinates' do
                        expect(subject.valid_location?(6,6)).to be_falsey
                        expect(subject.valid_location?(-1,-1)).to be_falsey
                    end
                end
            end
          end
    end
end
