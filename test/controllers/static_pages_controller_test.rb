require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get apartment_choice" do
    get :apartment_choice
    assert_response :success
  end

  test "should get blackboard_choice" do
    get :blackboard_choice
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
