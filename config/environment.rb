# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  # This is the string literal 'apikey', NOT the ID of your API key
  user_name: Rails.application.credentials.dig(:SENDGRID, :username),
  password: Rails.application.credentials.dig(:SENDGRID, :api_key), # This is the secret sendgrid API key which was
  # issued during API key creation
  domain: 'the-movie-review-app.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
