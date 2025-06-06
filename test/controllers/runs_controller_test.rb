require "test_helper"

class RunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent = agents(:one)
    @run = runs(:one)
  end

  test "should get new" do
    get new_agent_run_path(@agent)
    assert_response :success
  end

  test "should show run" do
    get agent_run_path(@agent, @run)
    assert_response :success
  end
end