class CreateTools < ActiveRecord::Migration[8.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.json :parameters_schema
      t.string :clazz

      t.timestamps
    end
  end
end
