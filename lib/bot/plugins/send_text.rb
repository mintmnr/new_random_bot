# frozen_string_literal: true

module Bot::Plugins
  class SendText
    def self.call(message:, text:)
      new(message, text).call
    end

    def initialize(message, text)
      @message = message
      @text = text
    end

    def call
      Bot.api.send_message(chat_id: @message.chat.id, text: @text)
    end
  end
end
