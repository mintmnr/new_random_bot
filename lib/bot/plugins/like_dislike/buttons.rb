# frozen_string_literal: true

module Bot::Plugins
  module LikeDislike
    module Buttons
      class << self
        def new_markup
          buttons = [
            [
              Telegram::Bot::Types::InlineKeyboardButton.new(text: '♥️',
                                                             callback_data: 'like'),
              Telegram::Bot::Types::InlineKeyboardButton.new(text: '💔',
                                                             callback_data: 'dislike')
            ]
          ]
          Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
        end

        def for_event(event)
          like_count = event.votes.where(score: 'like').length
          like_message = like_count.zero? ? '♥️' : "#{like_count} ♥️"

          dislike_count = event.votes.where(score: 'dislike').length
          dislike_message = dislike_count.zero? ? '💔' : "#{dislike_count} 💔"

          buttons = [
            [
              Telegram::Bot::Types::InlineKeyboardButton.new(text: like_message,
                                                             callback_data: 'like'),
              Telegram::Bot::Types::InlineKeyboardButton.new(text: dislike_message,
                                                             callback_data: 'dislike')
            ]
          ]
          Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
        end
      end
    end
  end
end
