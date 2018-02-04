# frozen_string_literal: true

module Bot::Plugins
  class SendImage
    attr_reader :folder

    MEM_PATH =  '../../../content/'

    def self.call(message:, folder:)
      Concurrent::Future.execute do
        new(message, folder).call
      end
    end

    def initialize(message, folder)
      @message = message
      @folder = folder
    end

    def call
      Bot.api.sendPhoto(chat_id: @message.chat.id,
                        photo: Faraday::UploadIO.new(select_random, 'image/png'))
    end

    private

    def select_random
      name = files.sample
      File.open(File.join(File.dirname(__FILE__),
                          "#{MEM_PATH}/#{folder}/#{name}"))
    end

    def files
      f = Dir.entries(File.join(File.dirname(__FILE__),
                                "#{MEM_PATH}/#{folder}"))
      f[2..-1]
    end
  end
end
