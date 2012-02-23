require 'test_helper'

class AnsweredQuestionInfosControllerTest < ActionController::TestCase
  setup do
    @answered_question_info = answered_question_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answered_question_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answered_question_info" do
    assert_difference('AnsweredQuestionInfo.count') do
      post :create, :answered_question_info => @answered_question_info.attributes
    end

    assert_redirected_to answered_question_info_path(assigns(:answered_question_info))
  end

  test "should show answered_question_info" do
    get :show, :id => @answered_question_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @answered_question_info.to_param
    assert_response :success
  end

  test "should update answered_question_info" do
    put :update, :id => @answered_question_info.to_param, :answered_question_info => @answered_question_info.attributes
    assert_redirected_to answered_question_info_path(assigns(:answered_question_info))
  end

  test "should destroy answered_question_info" do
    assert_difference('AnsweredQuestionInfo.count', -1) do
      delete :destroy, :id => @answered_question_info.to_param
    end

    assert_redirected_to answered_question_infos_path
  end
end
