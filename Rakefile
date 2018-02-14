# frozen_string_literal: true

Dir.glob('tasks/*.rake').each { |r| load r }
require './config/boot'

desc 'console'
task :console do
  ARGV.clear
  BotInitializer.setup_bot
  Pry.start
end

desc 'run'
task :listen do
  ListenLoop::Server.start

  Pry.start
end
