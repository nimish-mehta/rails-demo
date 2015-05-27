require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    a = users(:one)
    post :create, name: a.name, password: 'secret'
    assert_redirected_to admin_url
    assert_equal a.id, session[:user_id]
  end

  test "should fail login" do
    a = users(:one)
    post :create, name: a.name, password: 'public'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
