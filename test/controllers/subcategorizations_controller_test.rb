require 'test_helper'

class SubcategorizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subcategorization = subcategorizations(:one)
  end

  test "should get index" do
    get subcategorizations_url, as: :json
    assert_response :success
  end

  test "should create subcategorization" do
    assert_difference('Subcategorization.count') do
      post subcategorizations_url, params: { subcategorization: { categorization_id: @subcategorization.categorization_id, name: @subcategorization.name } }, as: :json
    end

    assert_response 201
  end

  test "should show subcategorization" do
    get subcategorization_url(@subcategorization), as: :json
    assert_response :success
  end

  test "should update subcategorization" do
    patch subcategorization_url(@subcategorization), params: { subcategorization: { categorization_id: @subcategorization.categorization_id, name: @subcategorization.name } }, as: :json
    assert_response 200
  end

  test "should destroy subcategorization" do
    assert_difference('Subcategorization.count', -1) do
      delete subcategorization_url(@subcategorization), as: :json
    end

    assert_response 204
  end
end
