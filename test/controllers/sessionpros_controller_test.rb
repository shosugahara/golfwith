require 'test_helper'

class SessionprosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessionpros_new_url
    assert_response :success
  end

end
