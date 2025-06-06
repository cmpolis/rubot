class Step < ApplicationRecord
  belongs_to :run
  validates_uniqueness_of :sequence, scope: :run_id
  enum :kind, %i[llm_request llm_chunk llm_response tool_request tool_output
  agent_thought sub_agent_call sub_agent_result error]
end
