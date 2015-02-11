require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "",
      email: "user@invalid",
      password: "123",
      admin: true}
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Example User",
      email: "user@example.com",
      password: "123",
      admin: false}
    end
    assert_template 
  end
end
