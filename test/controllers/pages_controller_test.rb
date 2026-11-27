require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "root renders the home page" do
    get root_url
    assert_response :success
  end

  test "each step of the flow renders" do
    [home_url, scanner_url, transaction_url(1), pin_url].each do |url|
      get url
      assert_response :success, "expected #{url} to render"
    end
  end

  test "all three demo transactions render" do
    [1, 2, 3].each do |id|
      get transaction_url(id)
      assert_response :success
    end
  end

  test "an unknown transaction returns 404" do
    get transaction_url(99)
    assert_response :not_found
  end

  test "scanner loads Instascan from this app, not rawgit" do
    get scanner_url
    assert_includes response.body, "/js/instascan.min.js"
    assert_not_includes response.body, "rawgit.com"
  end

  test "summary accepts a well-formed PIN by POST" do
    post summary_url, params: { pin: "1234" }
    assert_response :success
    assert_includes response.body, "Payment authorized"
  end

  test "summary rejects a malformed PIN" do
    post summary_url, params: { pin: "12ab" }
    assert_response :unprocessable_entity
  end
end
