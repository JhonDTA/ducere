# frozen_string_literal: true

# Message channel
class MessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    sleep 1
    @channel_user = current_user.channel_users.find_by(channel_id: params['id'])
    @channel = @channel_user.channel
    stream_for @channel
  end

  def unsubscribed
    stop_all_streams
  end

  def touch
    @channel_user.touch(:last_read_at)
  end
end
