# frozen_string_literal: true

# Application Helper
module ApplicationHelper

  # @param [String] type
  # @return [String]
  #
  def flash_type(type)
    case type
    when 'notice'
      'success'
    when 'alert'
      'danger'
    else
      type
    end
  end
end
