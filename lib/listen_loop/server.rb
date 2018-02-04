# frozen_string_literal: true

module ListenLoop
  class Server
    attr_reader :server

    def self.start
      Bot.logger.info('Starting bot')
      @server = Concurrent::TimerTask.new(execution_interval: 1,
                                          timeout_interval: 5,
                                          dup_on_deref: true) do
        messages = MessageFetcher.fetch

        puts messages.inspect
        ::Dispatcher.handle(messages)
      end

      @server.add_observer(TaskObserver.new)
      @server.execute
    end
  end
end
