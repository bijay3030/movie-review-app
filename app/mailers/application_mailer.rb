# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials[:mail_sender]
  layout 'mailer'
end
