# frozen_string_literal: true

class MoviePolicy < ApplicationPolicy
  def create?
    @user.admin?
  end
end
