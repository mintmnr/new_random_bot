# frozen_string_literal: true

class Bot
  def self.set(bot)
    @@bot ||= bot
  end
  class << self
    def method_missing(method, *args, &block)
      @@bot.send(method, *args, &block)
    end

    def respond_to_missing?(method_name, _include_private = false)
      @@bot.responds_to? method_name
    end
  end
end
