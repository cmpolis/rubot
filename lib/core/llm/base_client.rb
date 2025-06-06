# frozen_string_literal: true

module RubotCore
  module Llm
    class BaseClient
      attr_reader :model_config_data, :logger

      def initialize(model_config_data, logger: Logger.new(STDOUT))
        @model_config_data = model_config_data
        @logger = logger
      end
      
      def chat(messages, options = {})
        raise NotImplementedError, "#{self.class} does not implement chat"
      end

      def stream_chat(messages, options = {})
        raise NotImplementedError,
              "#{self.class} does not implement stream_chat"
      end
    end
  end
end
