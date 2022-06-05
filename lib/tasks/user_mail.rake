# frozen_string_literal: true

namespace :user do
  desc 'This is to send reminder email to unconfirmed users'
  task(send_reminder_mail_to_unconfirmed_users: :environment) do
    User.all.each do |user|
      UserMailer.unconfirmed_users(user, user.confirmation_token).deliver! unless user.confirmed?
    end
  end
end
