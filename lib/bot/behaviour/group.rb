# frozen_string_literal: true

module Bot::Behaviour
  class Group
    attr_reader :messages

    def initialize(messages)
      @messages = messages
    end

    def handle
      messages.each do |message|
        commands = CommandFinder.find(message)
        next if commands.empty?

        send("#{commands.first}_response", message)
      end
    end

    private

    def mem_response(message)
      MessageSender.call do
        Bot::Plugins::SendImage.call(message: message, folder: 'mems')
      end
    end

    def prediction_response(message)
      MessageSender.call do
        Bot::Plugins::SendPrediction.call(message: message)
      end
    end

    def help_response(message)
      MessageSender.call do
        Bot::Plugins::SendText.call(message: message,
                                    text: Settings.chat_params.static.help)
      end
    end

    def start_response(message)
      MessageSender.call do
        Bot::Plugins::SendText.call(message: message,
                                    text: Settings.chat_params.static.start)
      end
    end
  end
end
