# frozen_string_literal: true

require 'constants'

class User < ApplicationRecord
  include Constants::AppEnums
  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

  devise :registerable, :recoverable, :rememberable,
         :validatable, :confirmable,
         :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: { admin: ADMIN, audience: AUDIENCE }

  validates :first_name, :last_name, :role, presence: true
  validates :password, format: { with: PASSWORD_FORMAT }
end
