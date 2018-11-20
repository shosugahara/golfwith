require 'test_helper'

class SessionamasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessionamas_new_url
    assert_response :success
  end

end
