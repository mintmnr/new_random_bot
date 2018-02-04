# frozen_string_literal: true

module Bot::Plugins
  module LikeDislike
    class Updater
      def self.call(event, message)
        Bot.api.editMessageReplyMarkup(chat_id: message.chat.id,
                                       message_id: event.response_message_id,
                                       reply_markup: Buttons.for_event(event))
      end
    end
  end
end
