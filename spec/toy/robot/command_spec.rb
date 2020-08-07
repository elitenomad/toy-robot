require 'spec_helper'

module Toy
    module Robot
        RSpec.describe Command do
            let(:command) { Toy::Robot::Command.new }
          
            context 'PLACE' do
                describe 'when format is valid' do
                    it 'processes a PLACE command' do
                        command, *args = Toy::Robot::Command.parse("ALICE: PLACE 1,2,NORTH")
                        expect(command).to eq(:place)
                        expect(args).to eq([1, 2, "NORTH", "ALICE"])
                    end
                end
             
                describe 'when format is invalid' do
                    it "returns :invalid" do
                        command = Toy::Robot::Command.parse("PLACE 1, 2, NORTH")
                        expect(command).to eq([:invalid, "PLACE 1, 2, NORTH"])
                    end
                end
            end
          
            context 'MOVE' do
                describe 'when format is valid' do
                    it 'process a MOVE command' do
                        command, *args = Toy::Robot::Command.parse('ALICE: MOVE')
                        expect(command).to eq(:move)
                        expect(args).to eq(["ALICE"])
                    end
                end

                describe 'when format is invalid' do
                    it "returns :invalid" do
                        command = Toy::Robot::Command.parse("MOVE")
                        expect(command).to eq([:invalid, "MOVE"])
                    end
                end
            end
          
            context 'LEFT' do
                describe 'when format is valid' do
                    it 'process a LEFT command' do
                        command, *args = Toy::Robot::Command.parse('ALICE: LEFT')
                        expect(command).to eq(:turn_left)
                        expect(args).to eq(["ALICE"])
                    end
                end

                describe 'when format is invalid' do
                    it "returns :invalid" do
                        command = Toy::Robot::Command.parse("LEFT")
                        expect(command).to eq([:invalid, "LEFT"])
                    end
                end
            end
          
            context 'RIGHT' do
                describe 'when format is valid' do
                    it 'process a RIGHT command' do
                        command, *args = Toy::Robot::Command.parse('ALICE: RIGHT')
                        expect(command).to eq(:turn_right)
                        expect(args).to eq(["ALICE"])
                    end
                end

                describe 'when format is invalid' do
                    it "returns :invalid" do
                        command = Toy::Robot::Command.parse("RIGHT")
                        expect(command).to eq([:invalid, "RIGHT"])
                    end
                end
            end
          
          
            context 'REPORT' do
                describe 'when format is valid' do
                    it 'process a REPORT command' do
                        command, *args = Toy::Robot::Command.parse('ALICE: REPORT')
                        expect(command).to eq(:report)
                        expect(args).to eq(["ALICE"])
                    end
                end

                describe 'when format is invalid' do
                    it "returns :invalid" do
                        command = Toy::Robot::Command.parse("REPORT")
                        expect(command).to eq([:invalid, "REPORT"])
                    end
                end
            end
        end
    end
end

