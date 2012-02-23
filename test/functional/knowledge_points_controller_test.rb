require 'test_helper'

class KnowledgePointsControllerTest < ActionController::TestCase
  setup do
    @knowledge_point = knowledge_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_point" do
    assert_difference('KnowledgePoint.count') do
      post :create, :knowledge_point => @knowledge_point.attributes
    end

    assert_redirected_to knowledge_point_path(assigns(:knowledge_point))
  end

  test "should show knowledge_point" do
    get :show, :id => @knowledge_point.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @knowledge_point.to_param
    assert_response :success
  end

  test "should update knowledge_point" do
    put :update, :id => @knowledge_point.to_param, :knowledge_point => @knowledge_point.attributes
    assert_redirected_to knowledge_point_path(assigns(:knowledge_point))
  end

  test "should destroy knowledge_point" do
    assert_difference('KnowledgePoint.count', -1) do
      delete :destroy, :id => @knowledge_point.to_param
    end

    assert_redirected_to knowledge_points_path
  end
end
