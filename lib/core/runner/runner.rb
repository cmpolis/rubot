# frozen_string_literal: true

require_relative "../llm/client_factory"

module RubotCore
  class Runner
    attr_reader :client

    def initialize(model_config:, logger: Logger.new(STDOUT))
      @client = Llm::ClientFactory.build(model_config, logger: logger)
      @history = []

      # TODO brodcast handling

      # TODO persistence handling (e.g. save Step objects)
    end

    def run(initial_prompt)
      initial_message = [ { role: "user", content: initial_prompt } ]
      next_message = initial_message.clone

      response = nil
      begin
        while true
          # Update persistance and broadcast handlers

          response = client.chat(next_message)

          # Check for tool calls

          # Check for sub-agent calls

          # Update persistance and broadcast handlers

          break # TODO - add CLI or web stop-execution handling

        end
      rescue => e
        logger.error(e)
      end
      response
    end
  end
end
