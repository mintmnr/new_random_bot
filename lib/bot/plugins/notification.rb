# frozen_string_literal: true

module Bot::Plugins
  class Notification
    class << self
      def set
        Settings.notifications.chats.each do |chat|
          Concurrent::TimerTask.new(timer_params(chat)) { yield(chat) }
            .execute
        end
      end

      private 

      def timer_params(chat)
        { execution_interval: chat.interval, timeout_interval: 5 }
      end
    end
  end
end
