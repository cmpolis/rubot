class AddDefaultConfigToAgents < ActiveRecord::Migration[8.0]
  def change
    add_reference :agents, :default_config, foreign_key: { to_table: :llm_configs }
  end
end