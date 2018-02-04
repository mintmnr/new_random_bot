# frozen_string_literal: true

module Dispatcher
  class << self
    def handle(messages)
      parsed_messages = messages.map { |m| MessageParser.new(m) }

      sort_by_chat(parsed_messages).each do |chat_type, messages|
        send("handle_#{chat_type}_messages", messages)
      end
    end

    private

    def handle_supergroup_messages(messages)
      Bot::Behaviour::Group.new(messages).handle
    end

    def handle_group_messages(messages)
      Bot::Behaviour::Group.new(messages).handle
    end

    def handle_private_messages(messages)
      Bot::Behaviour::Private.new(messages).handle
    end

    def handle_channel_messages(messages); end

    def sort_by_chat(messages)
      messages.each_with_object({}) do |msg, res|
        res[msg.chat.type] ||= []
        res[msg.chat.type] << msg
      end
    end
  end
end
