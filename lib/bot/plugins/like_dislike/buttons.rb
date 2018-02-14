# frozen_string_literal: true

module Bot::Plugins
  module LikeDislike
    module Buttons
      class << self
        def build(message)
          buttons = [
            [
              Telegram::Bot::Types::InlineKeyboardButton
                .new(text: like_message(message), callback_data: 'like'),
              Telegram::Bot::Types::InlineKeyboardButton
                .new(text: dislike_message(message), callback_data: 'dislike')
            ]
          ]
          Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
        end

        private

        def like_message(message)
          count = if message.like_dislike
                    message.like_dislike&.votes&.where(score: 'like') || 0
                  else
                    0
                  end

          count.zero? ? '♥️' : "#{count} ♥️"
        end

        def dislike_message(message)
          count = if message.like_dislike
                    message.like_dislike&.votes&.where(score: 'dislike') || 0
                  else
                    0
                  end

          count.zero? ? '💔' : "#{count} 💔"
        end
      end
    end
  end
end
