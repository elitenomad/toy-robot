require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Print place commands for all the locations on the grid."
task :commands do
    (0..5).each do |i|
        (0..5).each do |j|
          puts "A#{i + j}: PLACE #{i},#{j},NORTH"
          puts "A#{i + j}: REPORT"
        end
    end
end