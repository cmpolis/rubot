# frozen_string_literal: true

require_relative 'open_ai_client'

module RubotCore
  module Llm
    class ClientFactory
      def self.build(model_config, logger: Logger.new(STDOUT))
        provider = model_config.fetch(:provider).to_s.downcase

        client_class =
          case provider
          when "openai"
            OpenAiClient
          else
            raise ArgumentError,
                  "Unsupported LLM provider: #{provider}"
          end

        client_class.new(model_config, logger: logger)
      end
    end
  end
end

