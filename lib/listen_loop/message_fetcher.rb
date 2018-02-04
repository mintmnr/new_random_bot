# frozen_string_literal: true

module ListenLoop
  module MessageFetcher
    @offset = 0

    def self.fetch
      response = Bot.api.getUpdates(offset: @offset + 1)
      unless response['ok']
        Bot.logger.error = response.to_s
        return
      end

      messages = response['result']
      return [] if messages&.empty?

      @offset = messages.last.dig('update_id')

      convert_to_types(messages)
    end

    def self.convert_to_types(messages)
      messages.map do |msg|
        Telegram::Bot::Types::Update.new(msg).message
      end
    end
  end
end
