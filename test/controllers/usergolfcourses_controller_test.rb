require 'test_helper'

class UsergolfcoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usergolfcourses_new_url
    assert_response :success
  end

end
