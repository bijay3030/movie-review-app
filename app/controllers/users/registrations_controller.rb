# frozen_string_literal: true

# rubocop:disable Style/Documentation

module Users
  class RegistrationsController < Devise::RegistrationsController
    # POST /resource
    def create
      params[:user][:role] = User.roles[:audience]
      super
    end
  end
end

# rubocop:enable Style/Documentation
