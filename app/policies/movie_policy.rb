# frozen_string_literal: true

class MoviePolicy < ApplicationPolicy
  def create?
    @user.admin?
  end

  def show?
    true
  end
end
