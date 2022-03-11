# frozen_string_literal: true

class DeviseMailerPreview < ActionMailer::Preview
  # http://127.0.0.1:3000/rails/mailers/devise_mailer/confirmation_instructions
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.first, 'faketoken')
  end
end
