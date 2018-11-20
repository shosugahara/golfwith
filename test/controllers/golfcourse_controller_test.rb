require 'test_helper'

class GolfcourseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get golfcourse_index_url
    assert_response :success
  end

end
