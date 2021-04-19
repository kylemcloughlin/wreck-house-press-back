require 'test_helper'

class AdvertismentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advertisment = advertisments(:one)
  end

  test "should get index" do
    get advertisments_url, as: :json
    assert_response :success
  end

  test "should create advertisment" do
    assert_difference('Advertisment.count') do
      post advertisments_url, params: { advertisment: { linkimg: @advertisment.linkimg, visible: @advertisment.visible } }, as: :json
    end

    assert_response 201
  end

  test "should show advertisment" do
    get advertisment_url(@advertisment), as: :json
    assert_response :success
  end

  test "should update advertisment" do
    patch advertisment_url(@advertisment), params: { advertisment: { linkimg: @advertisment.linkimg, visible: @advertisment.visible } }, as: :json
    assert_response 200
  end

  test "should destroy advertisment" do
    assert_difference('Advertisment.count', -1) do
      delete advertisment_url(@advertisment), as: :json
    end

    assert_response 204
  end
end
