# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: %i[sign_out]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name second_last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name second_last_name avatar])
  end

  private

  def resource_name
    t("activerecord.models.#{controller_name.classify.underscore}").downcase
  end
end
