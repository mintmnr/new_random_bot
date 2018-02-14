# frozen_string_literal: true

module MessageSender
  class << self
    def call(save_in_db: true)
      Concurrent::Future.execute do
        result = yield
        return false unless result['ok']
        return result unless save_in_db

        save_message(result['result'])
      end
    end

    private

    def save_message(data)
      MessageSaver.call(data)
    end
  end
end
