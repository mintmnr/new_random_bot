# frozen_string_literal: true

module ListenLoop
  class Server
    attr_reader :server

    def self.start
      Bot.logger.info('Starting bot')
      @server = Concurrent::TimerTask.new(execution_interval: 3, timeout_interval: 5) do
        messages = MessageFetcher.fetch

        puts messages.inspect
        ::Dispatcher.handle(messages)
      end

      @server.execute
    end
  end
end
