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
        send("#{commands.first}_response", message)
      end
    end

    private

    def mem_repsonse
      Bot::Plugins.SendImage.call(message: message,
                                  folder: 'mems')
    end

    def prediction_response
      Bot::Plugins.SendPrediction(message: message)
    end

    def help_response
      Bot::Plugins.SendHelp(message: message)
    end

    def start_response
      Bot::Plugins.SendStart(message: message)
    end
  end
end
