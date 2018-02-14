# frozen_string_literal: true

module Token
  def self.get(env = 'test')
    {
      'test' => File.read(File.join(
        File.dirname(__FILE__), '../.token')).strip,
      'production' => ENV['bot_token']
    }[env]
  end
end
