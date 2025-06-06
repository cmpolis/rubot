# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_06_06_172556) do
  create_table "agents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.text "prompt_template"
    t.datetime "updated_at", null: false
  end

  create_table "runs", force: :cascade do |t|
    t.integer "agent_id", null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.text "error_message"
    t.json "input_data"
    t.text "output"
    t.datetime "started_at"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_runs_on_agent_id"
  end

  create_table "steps", force: :cascade do |t|
    t.json "content"
    t.datetime "created_at", null: false
    t.integer "run_id", null: false
    t.integer "sequence"
    t.datetime "timestamp"
    t.integer "kind"
    t.datetime "updated_at", null: false
    t.index ["run_id"], name: "index_steps_on_run_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "clazz"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.json "parameters_schema"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "runs", "agents"
  add_foreign_key "steps", "runs"
end
