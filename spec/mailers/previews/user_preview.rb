# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def unconfirmed_users
    UserMailer.unconfirmed_users(User.first, 'faketoken')
  end
end
