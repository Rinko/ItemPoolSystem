require 'test_helper'

class StructuresControllerTest < ActionController::TestCase
  setup do
    @structure = structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create structure" do
    assert_difference('Structure.count') do
      post :create, :structure => @structure.attributes
    end

    assert_redirected_to structure_path(assigns(:structure))
  end

  test "should show structure" do
    get :show, :id => @structure.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @structure.to_param
    assert_response :success
  end

  test "should update structure" do
    put :update, :id => @structure.to_param, :structure => @structure.attributes
    assert_redirected_to structure_path(assigns(:structure))
  end

  test "should destroy structure" do
    assert_difference('Structure.count', -1) do
      delete :destroy, :id => @structure.to_param
    end

    assert_redirected_to structures_path
  end
end
