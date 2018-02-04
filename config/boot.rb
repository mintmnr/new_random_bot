# frozen_string_literal: true

require 'pry'
require 'telegram/bot'
require 'config'
require 'concurrent'
require 'unicode'

def require_folder(path)
  Dir.glob((File.dirname(File.absolute_path(__FILE__)) + '/' + path + '**/*.rb'))
     .each { |f| require f }
end

require_relative 'db.rb'
require_relative 'token.rb'
require_relative 'task_observer.rb'


Config.load_and_set_settings(Config.setting_files(__dir__, 'development'))
# require_relative 'config/enviroment.rb'

require_folder('initializers')

require_folder('../lib/listen_loop')

require_folder('../lib/bot')
require_folder('../lib/bot/*')

require_folder('../lib/models')
require_folder('../lib/helpers')

require_folder('../lib/services')
require_folder('../lib/services/like_dislike')

require_folder('../lib/domains')
require_folder('../lib/domains/*')

require_folder('../lib/job')

require_relative '../lib/dispatcher.rb'
require_relative '../lib/bot_initializer.rb'
