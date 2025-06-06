require "test_helper"

class LlmConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @llm_config = llm_configs(:one)
  end

  test "should get index" do
    get llm_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_llm_config_url
    assert_response :success
  end

  test "should create llm_config" do
    assert_difference("LlmConfig.count") do
      post llm_configs_url, params: { llm_config: {
        name: 'new-name', description: 'new-description', provider:
          'openai', version: '1.0' } }
    end

    assert_redirected_to llm_config_url(LlmConfig.last)
  end

  test "should show llm_config" do
    get llm_config_url(@llm_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_llm_config_url(@llm_config)
    assert_response :success
  end

  test "should update llm_config" do
    patch llm_config_url(@llm_config), params: { llm_config: {
      name: 'updated-name', description: 'updated-description', provider:
        'openai', version: '1.0' } }
    assert_redirected_to llm_config_url(@llm_config)
  end

  test "should destroy llm_config" do
    assert_difference("LlmConfig.count", -1) do
      delete llm_config_url(@llm_config)
    end

    assert_redirected_to llm_configs_url
  end
end
