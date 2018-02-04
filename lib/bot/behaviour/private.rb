# frozen_string_literal: true

module Bot::Behaviour
  class Private
    attr_reader :messages

    def initialize(messages)
      @messages = messages
    end

    def handle
      messages.each do |message|
        commands = CommandFinder.find(message)
        puts "Commands: #{commands}"
        next if commands.empty?
        send("#{commands.first}_response", message)
      end
    end

    private

    def mem_response(message)
      Bot::Plugins::SendImage.call(message: message,
                                   folder: 'mems')
    end

    def prediction_response(message)
      Bot::Plugins::SendPrediction.call(message: message)
    end

    def help_response(message)
      Bot::Plugins::SendHelp.call(message: message)
    end

    def start_response(message)
      Bot::Plugins::SendStart.call(message: message)
    end
  end
end
