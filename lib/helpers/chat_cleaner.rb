# frozen_string_literal: true

module ChatCleaner
  class << self
    def delete_message(message)
      Bot.api.deleteMessage(chat_id: message.chat.id,
                            message_id: message.message_id)
    rescue Telegram::Bot::Exceptions::ResponseError
      puts 'Can\'t delete the message'
    end
  end
end
