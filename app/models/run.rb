class Run < ApplicationRecord
  belongs_to :agent
  has_many :steps, dependent: :destroy

  def execute
    self.steps.create(kind: :llm_request, content: self.input_data, sequence: 0)

    # Handle missing input or unsaved run
    runner = RubotCore::Runner.new(model_config: {
      provider: "openai",
      model: "gpt-4.1-nano",
    })

    result = runner.run(self.input_data)
    puts "**** #{result}"
    puts "**** #{result[:content]}"
    puts "**** #{result['content']}"
    self.steps.create(kind: :llm_response, content: result[:content],
                      sequence: 1)
  end
end
