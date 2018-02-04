# frozen_string_literal: true

module Bot::Behaviour
  module Private 
    def self.handle(messages)
      puts "private handled"
      messages.each do |message|
        Bot.api.send_message(chat_id: message.chat.id,
                             text: 'private handled')
      end
    end
  end
end
