require 'test_helper'

class DeviseControllerTest < ActionController::TestCase
  test "should get registrationcontroller" do
    get :registrationcontroller
    assert_response :success
  end

end
