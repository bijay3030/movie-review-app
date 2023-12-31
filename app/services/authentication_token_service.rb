# frozen_string_literal: true

class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  private_constant :HMAC_SECRET
  ALGORITHM_TYPE = 'HS256'
  private_constant :ALGORITHM_TYPE

  def self.call(user_id)
    # The secret must be a string. A JWT::DecodeError will be raised if it isn't provided.
    payload = {
      user_id: user_id
    }
    JWT.encode(payload, HMAC_SECRET, ALGORITHM_TYPE)
  end
end
