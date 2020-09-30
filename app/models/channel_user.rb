# frozen_string_literal: true

# Chanel user model
class ChannelUser < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  def unreads
    channel.messages.where('created_at > :last_read_at',
                           last_read_at: last_read_at)
  end
end
