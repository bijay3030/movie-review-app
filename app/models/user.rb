# frozen_string_literal: true

require 'constants'

class User < ApplicationRecord
  include Constants::AppEnums

  devise :registerable, :recoverable, :rememberable,
         :validatable, :confirmable,
         :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: { admin: ADMIN, audience: AUDIENCE }

  validates :first_name, :last_name, :role, presence: true
  validate :password_format

  has_many :movie_user_reviews, dependent: :destroy

  def password_format
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    errors.add(:password, I18n.t('user.validation_errors.password.atleast_one_uppercase')) if password.match(/\p{Upper}/).nil?
    errors.add(:password, I18n.t('user.validation_errors.password.atleast_one_lowercase')) if password.match(/\p{Lower}/).nil?
    errors.add(:password, I18n.t('user.validation_errors.password.atleast_one_special_character')) unless password&.match?(regex)
    errors.add(:password, I18n.t('user.validation_errors.password.atleast_one_number')) unless password.count('0-9').positive?
    errors
  end
end
