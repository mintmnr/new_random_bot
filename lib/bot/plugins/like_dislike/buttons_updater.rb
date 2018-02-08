# frozen_string_literal: true

module Bot::Plugins
  module LikeDislike
    class ButtonsUpdater
      def self.call(message)
        Bot.api.editMessageReplyMarkup(chat_id: message.chat.id,
                                       message_id: message.message_id,
                                       reply_markup: Buttons.build(message))
      end
    end
  end
end
