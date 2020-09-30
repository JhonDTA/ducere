# frozen_string_literal: true

# Unreads channel
class UnreadsChannel < ApplicationCable::Channel
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
end
