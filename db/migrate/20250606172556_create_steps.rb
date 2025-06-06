class CreateSteps < ActiveRecord::Migration[8.1]
  def change
    create_table :steps do |t|
      t.references :run, null: false, foreign_key: true
      t.integer :sequence
      t.integer :kind
      t.json :content
      t.datetime :timestamp

      t.timestamps
    end
  end
end
