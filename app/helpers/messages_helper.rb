# frozen_string_literal: true

# Messages helper
module MessagesHelper
  def chat_align(message)
    'right' if message.user == current_user
  end

  def chat_name_align(message)
    message.user == current_user ? 'left' : 'right'
  end

  def chat_timestamp_align(message)
    message.user == current_user ? 'right' : 'left'
  end
end
