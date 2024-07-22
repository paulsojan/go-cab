# frozen_string_literal: true

require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = create(:user)
  end

  def test_create_user_with_valid_info
    valid_email = "john@example.com"

    valid_user_json = {
      email: valid_email,
      first_name: "John",
      last_name: "Smith",
      password: "welcome"
    }

    # Ensure that there are no users with this email in db
    User.where(email: valid_email).delete_all

    assert_difference "User.count", 1 do
      post api_v1_users_url, params: { user: valid_user_json, format: :json }

      assert_response :success
    end
  end

  def test_create_user_should_return_error_for_invalid_data
    valid_email = "john@example.com"

    invalid_user_json = {
      email: valid_email,
      first_name: "John",
      last_name: "Smith",
      password: nil
    }

    User.where(email: valid_email).delete_all

    post api_v1_users_url, params: { user: invalid_user_json, format: :json }

    assert_response :unprocessable_entity
    assert_equal "Password can't be blank", response_body["error"]
  end
end
