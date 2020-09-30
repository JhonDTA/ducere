# frozen_string_literal: true

# Channels helper
module ChannelsHelper
  # @param [Channel] channel
  def active_channel?(channel)
    channel == @channel
  end
end
