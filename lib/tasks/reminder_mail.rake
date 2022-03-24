# frozen_string_literal: true

namespace :demo do
  desc 'This is to send reminder email to unconfirmed users'
  task(mail_users: :environment) do
    User.all.each do |user|
      Devise::Mailer.confirmation_instructions(user, user.confirmation_token).deliver! unless user.confirmed?
    end
  end
end
