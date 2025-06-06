# frozen_string_literal: true

require_relative 'base_client'
require 'openai'

module RubotCore
  module Llm

    # Interface for calling OpenAI
    class OpenAiClient < BaseClient
      def initialize(model_config, logger: Logger.new(STDOUT))
        super
        @client = OpenAI::Client.new(
          access_token: model_config.fetch(:api_key, ENV["OPENAI_ACCESS_TOKEN"]),
          log_errors: model_config.fetch(:log_errors, true)
        )
      end

      def chat(messages, options = {})
        logger.info "Calling OpenAI with messages: #{messages}"

        request_params = prepare_request(messages, options.merge(stream: false))
        logger.info "Request params: #{request_params}"

        response = @client.chat(parameters: request_params)
        # unless response.success?
        #   logger.error "Error calling OpenAI: #{response}"
        # end
        # TODO error handling

        choice = response.dig("choices", 0, "message")
        if choice
          logger.info "Response: #{choice}"
          {
            role: choice["role"],
            content: choice["content"],
            tool_calls: choice["tool_calls"],
          }.compact
        end
      end

      private
        def prepare_request(messages, options = {})
          if messages.is_a?(String)
            messages = [{ role: "user", content: messages }]
          end
          {
            model: model_config_data[:model] || 'gpt-4.1-nano',
            messages: messages,
            # messages: [{ role: "user", content: "Hello, model"}],
            # temperature: options.fetch(:temperature,
            # model_config_data[:temperature]),
            # top_p: options.fetch(:top_p, model_config_data[:top_p]),
            # frequency_penalty: options.fetch(:frequency_penalty,
            # model_config_data[:frequency_penalty]),
            # presence_penalty: options.fetch(:presence_penalty,
            # model_config_data[:presence_penalty]),
            # max_tokens: options.fetch(:max_tokens,
            # model_config_data[:max_tokens]),
            stream: options.fetch(:stream, false)
          }.compact
        end
    end
  end
end