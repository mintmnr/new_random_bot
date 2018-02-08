# frozen_string_literal: true

class Chat
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :chat_id, type: Integer
  field :title, type: String

  has_many :messages

  def settings
    Settings.dig(:chat_params, chat_id.to_s.to_sym)
  end
end
