# frozen_string_literal: true

module Bot::Plugins
  class Share
    attr_reader :message

    def initialize(message)
      @message = message
      raise 'Chatname is not setted!' if message.chat&.username.nil?
    end

    def build_button
      Telegram::Bot::Types::InlineKeyboardButton
        .new(text: Settings.chat_params.buttons.share,
             switch_inline_query: build_message_url)
    end

    def build_keyboard
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [build_button])
    end

    private

    def build_message_url
      "https://t.me/#{message.chat.username}/#{message.message_id}"
    end
  end
end
