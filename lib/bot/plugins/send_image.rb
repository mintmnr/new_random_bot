module Bot::Plugins
  class SendImage 
    attr_reader :folder

    MEM_PATH =  "../../../content/"

    def initialize(message, folder)
      @message = message
      @folder = folder
    end

    def call
      Bot.get.api.sendPhoto(chat_id: @message.chat.id,
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

