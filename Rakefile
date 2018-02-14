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
  ARGV.clear
  ListenLoop::Server.start

  Pry.start
end

desc 'run notification sender'
task :notification do
  ARGV.clear
  BotInitializer.setup_bot

  Bot::Behaviour::Notification.call
  Pry.start
end
