module Bot::Behaviour
  class Notification
    def self.call
      Bot::Plugins::Notification.set do |chat|
        Bot.api.send_message(chat_id: chat.id.to_i, text: chat.message)
      end
    end
  end
end
