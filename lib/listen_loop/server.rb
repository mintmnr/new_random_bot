# frozen_string_literal: true

module ListenLoop
  class Server
    attr_reader :server

    def self.start
      Bot.logger.info('Starting bot')
      @server = Concurrent::TimerTask.new(execution_interval: 0.5,
                                          timeout_interval: 1) do
        messages = MessageFetcher.fetch

         if !messages.empty?
          ::Dispatcher.handle(messages)
         end
         true
      end

      @server.add_observer(TaskObserver.new)
      @server.execute
    end
  end
end
