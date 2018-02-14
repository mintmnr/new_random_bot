# frozen_string_literal: true

class Bot::Behaviour::Group
  module Mem
    class << self
      def answer(message)
        MessageSender.call do
          msg = Bot::Plugins::SendImage.call(message: message, folder: 'mems')
          send_response_keyboard(message: message,
                                 message_response: msg)
        end
      end

      private

      def send_response_keyboard(message:, message_response:)
        parsed_message = Telegram::Bot::Types::Update
                         .new(message: message_response['result']).message
        share_kb = Bot::Plugins::Share.new(parsed_message).build_keyboard

        Bot.api.send_message(chat_id: message.chat.id,
                             text: Settings.chat_params.mem.after_message,
                             reply_markup: share_kb)
      end
    end
  end
end
