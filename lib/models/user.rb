# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  has_many :events

  index({ user_id: 1 }, unique: true)
end
