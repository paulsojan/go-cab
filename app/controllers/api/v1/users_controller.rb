# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.create!(user_params)
    render_message(
      t("signup_successful"),
      :ok, { user: }
    )
  end

  private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end
end
