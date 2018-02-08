# frozen_string_literal: true

class MessageSaver
  attr_reader :message

  def self.call(message)
    new(message).call
  end

  def initialize(message)
    @message = message
  end

  def call
    chat = find_chat(message['chat'])
    Message.create(message_id: message['message_id'],
                   from: message['from'],
                   chat: message['chat'],
                   date: message['date'],
                   text: message['text'],
                   photo: message['photo'])
  end

  private

  def find_chat(chat_params)
    Chat.find_or_create_by(chat_id: chat_params['id']) do |chat|
      chat.title = chat_params['title']
    end
  end
end
