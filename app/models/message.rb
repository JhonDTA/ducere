# frozen_string_literal: true

# Message model
class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  default_scope { order(created_at: :asc) }
end
