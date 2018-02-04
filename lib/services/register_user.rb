# frozen_string_literal: true

module RegisterUser
  class << self
    def call(message)
      user_data = message.from.attributes
      User.find_or_create_by(user_id: user_data[:id]) do |r|
        user_data.each do |field, value|
          r[field] = value
        end
      end
    end
  end
end
