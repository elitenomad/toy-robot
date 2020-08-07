require "toy/robot/version"
require "toy/robot/robot"
require "toy/robot/grid"
require "toy/robot/game"
require "toy/robot/players"
require "toy/robot/command"
require "toy/robot/cli"

module Toy
  module Robot
    class Error < StandardError; end
    class FileNotExistsError < StandardError; end
    class FileFormatNotSupportedError < StandardError; end
    # Your code goes here...
  end
end
