class CreateAgents < ActiveRecord::Migration[8.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.text :description
      t.text :prompt_template

      t.timestamps
    end
  end
end
