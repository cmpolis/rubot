class CreateLlmConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :llm_configs do |t|
      t.string :name
      t.string :provider
      t.string :version
      t.json :default_parameters

      t.timestamps
    end
  end
end
