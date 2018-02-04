# frozen_string_literal: true

module Token
  def self.get(env = 'test')
    {
      'test' => '475166232:AAEID56y8Jf3POkH6Lkl6H7pQOrpm1W7VQY',
      'production' => ENV['bot_token']
    }[env]
  end
end
