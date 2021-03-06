require 'spec_helper'

module Toy
    module Robot
        RSpec.describe CLI do
            subject { Toy::Robot::CLI.new }

            context '#load' do
                it 'is expected to match expected_commands from test file' do
                    path =  File.dirname(__FILE__)  + "/../../support/usecase-1.txt"
                    commands = subject.load(path)
                    expected_commands = [
                        [:place, 0, 0, "NORTH", "ALICE"],
                        [:move, "ALICE"],
                        [:report, "ALICE"]
                    ]
                    
                    expect(commands).to eq(expected_commands)
                end

                context 'when file is not present' do
                    it 'is expected to log custom error to screen' do
                        path =  File.dirname(__FILE__)  + "/../../support/test.txt"
                        expect{ subject.load(path) }.to output("Looks like input file does not exist. Please provide the right one.\n").to_stdout
                    end
                end

                context 'when file format is not supported' do
                    it 'is expected to log custom error to screen' do
                        path =  File.dirname(__FILE__)  + "/../../support/test.csv"
                        expect{ subject.load(path) }.to output("Only txt files are supported currently.\n").to_stdout
                    end
                end
            end
        
            context '#run' do
                let(:game) { instance_double(Toy::Robot::Game)}
            
                before(:each) do
                    allow(subject).to receive(:game) { game }
                end
            
                context 'place command' do
                    it 'passes place command to game' do
                        expect(game).to receive(:place).with(0, 0, "NORTH", "ALICE")
                        subject.run([[:place, 0, 0, "NORTH", "ALICE"]])
                    end
                end
            
                context 'move command' do
                    it 'passes place command to game' do
                        expect(game).to receive(:move)
                        subject.run([[:move, "ALICE"]])
                    end
                end
            
            
                context 'left command' do
                    it 'passes place command to game' do
                        expect(game).to receive(:turn_left)
                        subject.run([[:turn_left, "ALICE"]])
                    end
                end
            
                context 'right command' do
                    it 'passes place command to game' do
                        expect(game).to receive(:turn_right)
                        subject.run([[:turn_right, "ALICE"]])
                    end
                end
            
                context 'report command' do
                    it 'passes place command to game' do
                        expect(game).to receive(:report)
                        subject.run([[:report, "ALICE"]])
                    end
                end
            end
        end
    end
end
