# frozen_string_literal: true

# Denylist model for storing revoked tokens
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
