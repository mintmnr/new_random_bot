# frozen_string_literal: true

module Bot::Plugins
  module LikeDislike
    class CallbackHandler
      class << self
      def call(message)
        begin
          event = Event.find_by(chat_id: message.chat.id,
                                response_message_id: message.message.message_id)
        rescue Mongoid::Errors::DocumentNotFound
          puts "Can't find message!"
          return
        end

        vote = add_vote(event, message)
        ButtonsUpdater.call(event, message) if vote
      end

        private

      def add_vote(event, message)
        vote = event.votes.where(user_id: message.from.id).first
        if vote.nil?
          event.votes.create(user_id: message.from.id,
                             score: message.data)
        else
          return false unless score_changed?(vote, message)
          vote.update(score: message.data)
        end
      end

      def score_changed?(vote, message)
        vote.score != message.data
      end
    end
    end
  end
end
