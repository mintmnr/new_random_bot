# frozen_string_literal: true

module Bot::Behaviour
  class Private
    attr_reader :messages

    def initialize(messages)
      @messages = messages
    end

    def handle
      messages.each do |message|
        Bot::Plugins::SendText.call(message: message,
                               text: Settings.chat_params.static.private)
      end
    end
  end
end
