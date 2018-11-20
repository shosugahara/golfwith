require 'test_helper'

class UseramasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get useramas_new_url
    assert_response :success
  end

end
