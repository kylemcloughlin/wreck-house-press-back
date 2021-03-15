require 'test_helper'

class SuSbsriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @su_sbsription = su_sbsriptions(:one)
  end

  test "should get index" do
    get su_sbsriptions_url, as: :json
    assert_response :success
  end

  test "should create su_sbsription" do
    assert_difference('SuSbsription.count') do
      post su_sbsriptions_url, params: { su_sbsription: { cost: @su_sbsription.cost, name: @su_sbsription.name } }, as: :json
    end

    assert_response 201
  end

  test "should show su_sbsription" do
    get su_sbsription_url(@su_sbsription), as: :json
    assert_response :success
  end

  test "should update su_sbsription" do
    patch su_sbsription_url(@su_sbsription), params: { su_sbsription: { cost: @su_sbsription.cost, name: @su_sbsription.name } }, as: :json
    assert_response 200
  end

  test "should destroy su_sbsription" do
    assert_difference('SuSbsription.count', -1) do
      delete su_sbsription_url(@su_sbsription), as: :json
    end

    assert_response 204
  end
end
