require 'test_helper'

class RawUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw_user = raw_users(:one)
  end

  test "should get index" do
    get raw_users_url, as: :json
    assert_response :success
  end

  test "should create raw_user" do
    assert_difference('RawUser.count') do
      post raw_users_url, params: { raw_user: { email: @raw_user.email, expiry: @raw_user.expiry, token: @raw_user.token } }, as: :json
    end

    assert_response 201
  end

  test "should show raw_user" do
    get raw_user_url(@raw_user), as: :json
    assert_response :success
  end

  test "should update raw_user" do
    patch raw_user_url(@raw_user), params: { raw_user: { email: @raw_user.email, expiry: @raw_user.expiry, token: @raw_user.token } }, as: :json
    assert_response 200
  end

  test "should destroy raw_user" do
    assert_difference('RawUser.count', -1) do
      delete raw_user_url(@raw_user), as: :json
    end

    assert_response 204
  end
end
