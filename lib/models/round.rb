# frozen_string_literal: true

class Round
  include Mongoid::Document
  include Mongoid::Timestamps

  field :starts_at, type: Time
  field :ends_at, type: Time
  field :duration, type: Integer
  field :active, type: Boolean, default: true

  has_many :events
  belongs_to :chat

  def self.current_round(chat_id)
    Round.where(chat_id: Chat.find_by(chat_id: chat_id),
                active: true).first
  end

  def remaining_time
    remaining_seconds = ends_at.to_f - DateTime.now.to_f
    remaining_seconds.positive? ? remaining_seconds : 0
  end
end
