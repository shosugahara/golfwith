require 'test_helper'

class SessiongolfcoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessiongolfcourses_new_url
    assert_response :success
  end

end
