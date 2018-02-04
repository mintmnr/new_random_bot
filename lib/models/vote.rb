# frozen_string_literal: true

class Vote
  include Mongoid::Document

  embedded_in :event

  field :score, type: String
  field :user_id, type: BigDecimal
end
