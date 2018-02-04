# frozen_string_literal: true

class Event
  include Mongoid::Document

  field :chat_id, type: String

  embeds_many :votes

  belongs_to :user
  belongs_to :round

  field :response_message_id, type: BigDecimal
end
