require "spec_helper"

module Toy
  module Robot
    RSpec.describe Players do
      subject { Toy::Robot::Players.new }
      let(:robot) { Toy::Robot::Robot.new(0, 0, "NORTH") }

      after(:each) do
        subject.clear
      end

      it "is expected to return empty list of players" do
        expect(subject.list).to eq([])
      end

      context "#add" do
        describe("when name and robot are passed") do
          before do
            subject.add("ALICE", robot)
          end

          it "is expected to increase the size of list by 1" do
            expect(subject.list.length).to equal(1)
          end
        end
      end

      context "#exists?" do
        describe("when player is searched for presence") do
          before do
            subject.add("ALICE", robot)
          end

          it "is expected to return true if present" do
            expect(subject.exists?("ALICE")).to be_truthy
          end

          it "is expected to return false if not present" do
            expect(subject.exists?("TEST")).to be_falsey
          end
        end
      end

      context "#find_robot" do
        describe("when player searches by name for a robot") do
          before do
            subject.add("ALICE", robot)
          end

          it "is expected to return robot if present" do
            expect(subject.find_robot("ALICE")).to eq(robot)
          end

          it "is expected to return nil if not present" do
            expect(subject.find_robot("TEST")).to be_nil
          end
        end
      end
    end
  end
end
