# frozen_string_literal: true

class ButtonsResponse
  def initialize(message, markup: nil, text: nil)
    @message = message
    @markup = markup || LikeDislike::Buttons.new_markup
    @text = text || "Оцени мем юзера #{message.from.username}"
  end

  def send_response
    Bot.api.send_message(chat_id: @message.chat.id,
                         text: @text,
                         reply_markup: @markup)
  end
end
