# frozen_string_literal: true

require 'constants'

class User < ApplicationRecord
  include Constants::AppEnums
  #   PASSWORD_FORMAT = /\A
  #   (?=.{8,})          # Must contain 8 or more characters
  #   (?=.*\d)           # Must contain a digit
  #   (?=.*[a-z])        # Must contain a lower case character
  #   (?=.*[A-Z])        # Must contain an upper case character
  #   (?=.*[[:^alnum:]]) # Must contain a symbol
  # /x
  #   private_constant :PASSWORD_FORMAT

  devise :registerable, :recoverable, :rememberable,
         :validatable, :confirmable,
         :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: { admin: ADMIN, audience: AUDIENCE }

  validates :first_name, :last_name, :role, presence: true
  # validates :password, format: { with: PASSWORD_FORMAT }
  validate :password_uppercase
  validate :password_lower_case
  validate :password_special_char
  validate :password_contains_number

  has_many :movie_user_reviews, dependent: :destroy

  def password_uppercase
    return unless password.match(/\p{Upper}/).nil?

    errors.add(:password, ' must contain at least 1 uppercase ')
  end

  def password_lower_case
    return unless password.match(/\p{Lower}/).nil?

    errors.add(:password, ' must contain at least 1 lowercase ')
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    return if password&.match?(regex)

    errors.add(:password, ' must contain special character')
  end

  def password_contains_number
    return if password.count('0-9').positive?

    errors.add(:password, ' must contain at least one number')
  end
end
