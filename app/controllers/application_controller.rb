# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

    def current_user
      @_current_user ||= User.first
    end
end
