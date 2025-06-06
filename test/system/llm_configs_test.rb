require "application_system_test_case"

class LlmConfigsTest < ApplicationSystemTestCase
  setup do
    @llm_config = llm_configs(:one)
  end

  test "visiting the index" do
    visit llm_configs_url
    assert_selector "h1", text: "Llm configs"
  end

  test "should create llm config" do
    visit llm_configs_url
    click_on "New llm config"

    click_on "Create Llm config"

    assert_text "Llm config was successfully created"
    click_on "Back"
  end

  test "should update Llm config" do
    visit llm_config_url(@llm_config)
    click_on "Edit this llm config", match: :first

    click_on "Update Llm config"

    assert_text "Llm config was successfully updated"
    click_on "Back"
  end

  test "should destroy Llm config" do
    visit llm_config_url(@llm_config)
    click_on "Destroy this llm config", match: :first

    assert_text "Llm config was successfully destroyed"
  end
end
