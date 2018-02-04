# frozen_string_literal: true

module CommandFinder
  class << self
    def find(message)
      Settings.chat_params.commands.keys.reject do |command|
        (message_words(message) & Settings.chat_params.commands[command]).empty?
      end
    end

    private

    def message_words(message)
      return [] if message.text&.empty?
      Unicode.downcase(message.text)
             .gsub(/#{Settings.bot.name}/i, '')
             .gsub(/[[:punct:]]/, '')
             .split
    end
  end
end
