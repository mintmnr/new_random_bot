# frozen_string_literal: true

class Message
  include Mongoid::Document

  field :message_id, type: Integer
  field :date, type: Integer

  field :text, type: String
  field :photo, type: Array

  field :from, type: Hash

  belongs_to :chat

  embeds_one :like_dislike
end
