require 'test_helper'

class BarMessagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bar_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bar_message" do
    assert_difference('BarMessage.count') do
      post :create, :bar_message => { }
    end

    assert_redirected_to bar_message_path(assigns(:bar_message))
  end

  test "should show bar_message" do
    get :show, :id => bar_messages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bar_messages(:one).to_param
    assert_response :success
  end

  test "should update bar_message" do
    put :update, :id => bar_messages(:one).to_param, :bar_message => { }
    assert_redirected_to bar_message_path(assigns(:bar_message))
  end

  test "should destroy bar_message" do
    assert_difference('BarMessage.count', -1) do
      delete :destroy, :id => bar_messages(:one).to_param
    end

    assert_redirected_to bar_messages_path
  end
end
