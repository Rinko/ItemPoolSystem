require 'test_helper'

class KnowledgePointInfosControllerTest < ActionController::TestCase
  setup do
    @knowledge_point_info = knowledge_point_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_point_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_point_info" do
    assert_difference('KnowledgePointInfo.count') do
      post :create, :knowledge_point_info => @knowledge_point_info.attributes
    end

    assert_redirected_to knowledge_point_info_path(assigns(:knowledge_point_info))
  end

  test "should show knowledge_point_info" do
    get :show, :id => @knowledge_point_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @knowledge_point_info.to_param
    assert_response :success
  end

  test "should update knowledge_point_info" do
    put :update, :id => @knowledge_point_info.to_param, :knowledge_point_info => @knowledge_point_info.attributes
    assert_redirected_to knowledge_point_info_path(assigns(:knowledge_point_info))
  end

  test "should destroy knowledge_point_info" do
    assert_difference('KnowledgePointInfo.count', -1) do
      delete :destroy, :id => @knowledge_point_info.to_param
    end

    assert_redirected_to knowledge_point_infos_path
  end
end
