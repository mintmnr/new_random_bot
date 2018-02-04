# frozen_string_literal: true

class MessageParser
  def initialize(message)
    @message = message
  end

  def chat
    # TODO: change with the &
    if @message.respond_to?(:chat)
      @message&.chat
    else
      @message&.message&.chat
    end
  end

  def type
    @message
  end

  def method_missing(method_name, *args)
    @message.send(method_name, *args)
  end

  def respond_to_missing?(method_name, include_private = false)
    @message.respond_to?(method_name) || super
  end
end

class MessageParserError < StandardError
end
