# frozen_string_literal: true

class DeviseMailer < Devise::Mailer
  # Optional. eg. `confirmation_url`
  include Devise::Controllers::UrlHelpers
  # to make sure that your mailer uses the devise views
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts = {})
    attachments.inline['truemark.png'] = File.read('app/assets/images/truemark.png')
    super
  end
end
