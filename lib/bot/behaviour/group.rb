# frozen_string_literal: true

module Bot::Behaviour
  module Group 
    def self.handle(messages)
      messages.each do |message|
        # Bot.api.send_message(chat_id: message.chat.id,
                              # text: 'group handled')
        Bot::Plugins::SendImage.new(message, "mems").call
      end
    end
  end
end
