require 'test_helper'

class WisdomsControllerTest < ActionController::TestCase
  setup do
    @wisdom = wisdoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wisdoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wisdom" do
    assert_difference('Wisdom.count') do
      post :create, wisdom: { body: @wisdom.body, category_id: @wisdom.category_id, title: @wisdom.title, user_id: @wisdom.user_id }
    end

    assert_redirected_to wisdom_path(assigns(:wisdom))
  end

  test "should show wisdom" do
    get :show, id: @wisdom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wisdom
    assert_response :success
  end

  test "should update wisdom" do
    patch :update, id: @wisdom, wisdom: { body: @wisdom.body, category_id: @wisdom.category_id, title: @wisdom.title, user_id: @wisdom.user_id }
    assert_redirected_to wisdom_path(assigns(:wisdom))
  end

  test "should destroy wisdom" do
    assert_difference('Wisdom.count', -1) do
      delete :destroy, id: @wisdom
    end

    assert_redirected_to wisdoms_path
  end
end
