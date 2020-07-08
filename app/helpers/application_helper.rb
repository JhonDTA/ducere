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

  # Returns the full title on a per-page basis.
  # @param [String] page_title
  # @return [String]
  #
  def full_title(page_title = '')
    base_title = t('app_name')
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
