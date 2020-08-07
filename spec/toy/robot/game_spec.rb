require "spec_helper"

module Toy
  module Robot
    RSpec.describe Game do
      let(:grid) { Toy::Robot::Grid.new(6, 6) }
      let(:players) { Toy::Robot::Players.new }

      subject { Toy::Robot::Game.new(grid, players) }

      context "Single Player" do
        describe "When positional values are within the boundary" do
          before do
            subject.place(0, 4, "NORTH", "ALICE")
          end

          it "is expected to place the robot onto a valid position" do
            player = subject.players.list.first
            expect(player[:robot]).not_to be_nil
          end
        end

        describe "When positional values are not within the boundary" do
          before do
            subject.place(6, 6, "NORTH", "ALICE")
          end
          it "is expected to place the robot onto a valid position" do
            player = subject.players.list.first
            expect(player).to be_nil
          end
        end

        context "When positioinal values are exactly at boundary" do
          before do
            subject.place(0, 5, "NORTH", "ALICE")
          end

          it "is expected to not move past the boundary" do
            subject.move
            expect { subject.report("ALICE") }.to output("ALICE: 0, 5, NORTH\n").to_stdout
          end
        end
      end

      context "Multiple Players" do
        describe "When positional values are within the boundary" do
          before do
            subject.place(0, 4, "NORTH", "ALICE")
            subject.place(0, 5, "NORTH", "BOB")
          end

          it "is expected to place the both the robots onto a valid position" do
            player1 = subject.players.list.first
            player2 = subject.players.list.last

            expect(player1[:robot]).not_to be_nil
            expect(player2[:robot]).not_to be_nil
          end
        end

        describe "When positional values for two players are same" do
          before do
            subject.place(0, 4, "NORTH", "ALICE")
            subject.place(0, 4, "NORTH", "BOB")
          end

          it "is expected to place only the first robot onto a valid position and ignore the next" do
            player = subject.players.list.first
            expect(player[:robot]).not_to be_nil
            expect(subject.players.list.count).to eq(1)
          end
        end
      end
    end
  end
end
