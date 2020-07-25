# frozen_string_literal: true

# Application Mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'mailer@ducere.com'
  layout 'mailer'
end
