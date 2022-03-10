# frozen_string_literal: true

require 'constants'

class User < ApplicationRecord
  include Constants::AppEnums

  devise :registerable, :recoverable, :rememberable,
         :validatable, :confirmable,
         :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: { admin: ADMIN, audience: AUDIENCE }
end
