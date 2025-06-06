class CreateRuns < ActiveRecord::Migration[8.1]
  def change
    create_table :runs do |t|
      t.references :agent, null: false, foreign_key: true
      t.json :input_data
      t.integer :status
      t.text :output
      t.datetime :started_at
      t.datetime :completed_at
      t.text :error_message

      t.timestamps
    end
  end
end
