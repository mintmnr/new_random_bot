# frozen_string_literal: true

module RegisterEvent
  class << self
    def call(message, linked_message_id)
      puts "\n\n\n\n\n"
      puts "Round is #{CurrentRound.instance.chats[message.chat.id].id}"
      puts "Round last is #{Round.last.id}"
      puts "\n\n\n\n"
      Event.create!(chat_id: message.chat.id,
                    user_id: message.from.id,
                    round_id: CurrentRound.instance.chats[message.chat.id].id,
                    response_message_id: linked_message_id)
    end
  end
end
