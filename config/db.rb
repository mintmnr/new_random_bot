# frozen_string_literal: true

require 'mongoid'

ENV['MONGOID_ENV'] ||= 'development'

Mongoid.load!(File.join(__dir__, 'mongoid.yml'))

Mongo::Logger.logger.level = Logger::FATAL
# Mongoid.logger.level = Logger::DEBUG
# Mongo::Logger.logger.level = Logger::DEBUG
