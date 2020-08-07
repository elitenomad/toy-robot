require "spec_helper"

module Toy
  module Robot
    RSpec.describe Toy::Robot::Robot do
      #           N
      #           |
      #           |
      #  W ----------------- E
      #           |
      #           |
      #           |
      #           S
      #
      context "Movements" do
        subject { Toy::Robot::Robot.new(0, 0, "NORTH") }
        context "#move_east" do
          describe "when moved 3 times" do
            it "is expected to move 3 times in the east direction" do
              3.times { subject.move_east }
              expect(subject.x).to eq(3)
            end
          end
        end

        context "#move_west" do
          describe "when moved 3 times" do
            it "is expected to move 3 times in west direction" do
              3.times { subject.move_west }
              expect(subject.x).to eq(-3)
            end
          end
        end

        context "#move_north" do
          describe "when moved 3 times" do
            it "is expected to move 3 times in north direction" do
              3.times { subject.move_north }
              expect(subject.y).to eq(3)
            end
          end
        end

        context "#move_north" do
          describe "when moved 3 times" do
            it "is expected to move 3 times in south direction" do
              3.times { subject.move_north }
              expect(subject.y).to eq(3)
            end
          end
        end

        context "move" do
          context "when facing north" do
            subject { Toy::Robot::Robot.new(0, 0, "NORTH") }
            it "is expected to move north" do
              3.times { subject.move }
              expect(subject.y).to eq(3)
            end
          end

          context "when facing south" do
            subject { Toy::Robot::Robot.new(0, 0, "SOUTH") }
            it "is expected to move south" do
              3.times { subject.move }
              expect(subject.y).to eq(-3)
            end
          end

          context "when facing east" do
            subject { Toy::Robot::Robot.new(0, 0, "EAST") }
            it "is expected to move east" do
              3.times { subject.move }
              expect(subject.x).to eq(3)
            end
          end

          context "when facing west" do
            subject { Toy::Robot::Robot.new(0, 0, "WEST") }
            it "is expected to move west" do
              3.times { subject.move }
              expect(subject.x).to eq(-3)
            end
          end
        end
      end

      context "Turns or Rotations" do
        context "when facing north" do
          subject { Toy::Robot::Robot.new(0, 0, "NORTH") }
          it "turn_left is expected to turn west" do
            subject.turn_left
            expect(subject.direction).to eq("WEST")
          end

          it "turn_right is expected to turn east" do
            subject.turn_right
            expect(subject.direction).to eq("EAST")
          end

          it "is expected to to return next move as (0,1)" do
            expect(subject.next_move).to eq([0, 1])
          end
        end

        context "when facing south" do
          subject { Toy::Robot::Robot.new(0, 0, "SOUTH") }

          it "turn_left is expected to turn east" do
            subject.turn_left
            expect(subject.direction).to eq("EAST")
          end

          it "turn_right is expected to turn west" do
            subject.turn_right
            expect(subject.direction).to eq("WEST")
          end
        end
      end

      context "Report" do
        subject { Toy::Robot::Robot.new(0, 0, "NORTH") }
        describe "when requested" do
          it "is expected to return an object about robots position and direction" do
            expect(subject.report).to eq({ x: 0, y: 0, direction: "NORTH" })
          end
        end
      end
    end
  end
end
