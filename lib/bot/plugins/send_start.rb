module Bot::Plugins
  class SendStart
    def self.call(message:)
      new(message).call
    end

    def initialize(message)
      @message = message
    end

    def call
      Bot.api.send_message(chat_id: message.chat.id,
                           text: Settings.chat_params.help)
                        
    end
  end
end
