# frozen_string_literal: true

module Plugins
  class LikeDislike
    include Mongoid::Document

    embedded_in :message

    field :votes, type: Hash
  end
end
