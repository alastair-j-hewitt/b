require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get scanner" do
    get pages_scanner_url
    assert_response :success
  end

  test "should get confirmation" do
    get pages_confirmation_url
    assert_response :success
  end

  test "should get pin" do
    get pages_pin_url
    assert_response :success
  end

  test "should get summary" do
    get pages_summary_url
    assert_response :success
  end

  test "should get t1" do
    get pages_t1_url
    assert_response :success
  end

  test "should get t2" do
    get pages_t2_url
    assert_response :success
  end

  test "should get t3" do
    get pages_t3_url
    assert_response :success
  end

end
