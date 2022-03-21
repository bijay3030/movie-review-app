# frozen_string_literal: true

class MovieUserReviewPolicy < ApplicationPolicy
  def create?
    @user.audience?
  end
end
