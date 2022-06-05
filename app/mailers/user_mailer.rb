# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Optional. eg. `confirmation_url`
  include Devise::Controllers::UrlHelpers

  def unconfirmed_users(user, token)
    @token = token
    @user = user
    mail(to: user.email, subject: I18n.t('mailer.reminder_confirmation_instruction.reminder_subject'))
  end
end
