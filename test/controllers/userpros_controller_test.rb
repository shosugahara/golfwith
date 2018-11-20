require 'test_helper'

class UserprosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userpros_new_url
    assert_response :success
  end

end
