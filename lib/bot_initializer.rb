# frozen_string_literal: true

class BotInitializer
  class << self
    def setup_bot(_token = nil)
      @token = get_token
      bot = Telegram::Bot::Client.new(@token,
                                logger: Logger.new($stdout))
      Bot.set(bot)
    end

    private

    def get_token
      Token.get('test') || token
    end
  end

  def listen
    setup_bot.listen do |message|
      Dispatcher.handle(message)
    end
  end
end
