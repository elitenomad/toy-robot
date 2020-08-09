require "spec_helper"

module Toy
  module Robot
    RSpec.describe Players do
      subject { Toy::Robot::Players.new }
      let(:robot) { Toy::Robot::Robot.new(0, 0, "NORTH") }
      let(:robot_2) { Toy::Robot::Robot.new(0, 1, "NORTH")  }

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

      context "#already_positioned_in_the_location" do
        describe("when a new player is positioned in a filled location") do
          before do
            subject.add("ALICE", robot)
          end

          it "is expected to return falsey" do
            expect(subject.already_positioned_in_the_location?(0, 0)).to be_falsey
          end
        end

        describe("when player is positioned in a distinct location") do
          before do
            subject.add("ALICE", robot)
          end

          it "is expected to return truthy" do
            expect(subject.already_positioned_in_the_location?(1,1)).to be_truthy
          end
        end
      end

      context "#overlap_on_next_move" do
        describe("when player moves a robot to a location where its filled") do
          before do
            subject.add("ALICE", robot)
            subject.add("BOB", robot_2)
          end

          it "is expected to return falsey" do
            expect(subject.overlap_on_next_move?(0, 1, "ALICE")).to be_falsey
          end
        end

        describe("when player moves a robot to a location where its empty") do
          before do
            subject.add("ALICE", robot)
            subject.add("BOB", robot_2)
          end

          it "is expected to return truthy" do
            expect(subject.overlap_on_next_move?(2, 0, "ALICE")).to be_truthy
          end
        end
      end
    end
  end
end
