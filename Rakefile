require 'rake'
require 'rake/testtask'

task default: 'test'

Rake::TestTask.new do |task|
  task.pattern = 'test/*_test.rb'
end

task :loop do
  100.times do
    Rake::Task["test"].execute
  end
end
