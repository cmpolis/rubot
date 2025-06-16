# frozen_string_literal: true

require "test_helper"

class OpenAiClientTest < ActiveSupport::TestCase
  test "can be built from ClientFactory" do
    client = RubotCore::Llm::ClientFactory.build({
      provider: "openai",
      model: "gpt-4.0-nano" })
    assert_not_nil client
    assert client.is_a? RubotCore::Llm::OpenAiClient
  end
end
