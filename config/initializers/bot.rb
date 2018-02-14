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

class BotInitializer
  class << self
    def setup_bot(_token = nil)
      @token = get_token
      bot = Telegram::Bot::Client.new(@token,
                                logger: Logger.new($stdout))
      Bot.set(bot)
    end

    def get_token
      Token.get('test') || token
    end
  end
end

BotInitializer.setup_bot
