require 'test_helper'

class FakeUserControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get fake_user_get_url
    assert_response :success
  end

end
