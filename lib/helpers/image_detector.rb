# frozen_string_literal: true

module ImageDetector
  class << self
    def image_present?(message)
      return false unless message&.photo
      !message.photo.empty?
    end
  end
end
