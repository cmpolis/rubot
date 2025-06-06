require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should be root" do
    get root_url
    # TODO: assert content
    assert_response :success
  end
end
