# frozen_string_literal: true

# require_relative './dictionary'

module Bot::Plugins
  class SendPrediction
    attr_reader :message

    PREDICTION_FILE = '../../../content/predictions.yml'

    def self.call(message:)
      new(message).call
    end

    def initialize(message)
      @message = message
    end

    def call
      Concurrent::Future.execute do
        Bot.api.send_message(chat_id: message.chat.id,
                             text: make_prediction)
      end
    end

    def make_prediction
      "Итак, #{message.from.username}\n#{prediction}"
    end

    private

    def read_predictions
      YAML.safe_load(File.open(File.join(
                                 File.dirname(__FILE__), PREDICTION_FILE
      )))
    end

    def prediction
      pr = read_predictions
      [pr['when'].sample,
       pr['who'].sample,
       pr['what'].sample,
       pr['happened'].sample].join(' ')
    end
  end
end
