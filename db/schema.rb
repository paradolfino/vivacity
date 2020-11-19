# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_17_231554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "status"
    t.bigint "team_member_id", null: false
    t.bigint "project_id", null: false
    t.bigint "organization_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_issues_on_organization_id"
    t.index ["project_id"], name: "index_issues_on_project_id"
    t.index ["team_id"], name: "index_issues_on_team_id"
    t.index ["team_member_id"], name: "index_issues_on_team_member_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "organization_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_projects_on_organization_id"
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id", null: false
    t.bigint "team_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_sprints_on_organization_id"
    t.index ["project_id"], name: "index_sprints_on_project_id"
    t.index ["team_id"], name: "index_sprints_on_team_id"
  end

  create_table "sub_issues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "status"
    t.bigint "team_member_id", null: false
    t.bigint "project_id", null: false
    t.bigint "organization_id", null: false
    t.bigint "team_id", null: false
    t.bigint "issue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_sub_issues_on_issue_id"
    t.index ["organization_id"], name: "index_sub_issues_on_organization_id"
    t.index ["project_id"], name: "index_sub_issues_on_project_id"
    t.index ["team_id"], name: "index_sub_issues_on_team_id"
    t.index ["team_member_id"], name: "index_sub_issues_on_team_member_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_team_members_on_organization_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_teams_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "issues", "organizations"
  add_foreign_key "issues", "projects"
  add_foreign_key "issues", "team_members"
  add_foreign_key "issues", "teams"
  add_foreign_key "organizations", "users"
  add_foreign_key "projects", "organizations"
  add_foreign_key "projects", "teams"
  add_foreign_key "sprints", "organizations"
  add_foreign_key "sprints", "projects"
  add_foreign_key "sprints", "teams"
  add_foreign_key "sub_issues", "issues"
  add_foreign_key "sub_issues", "organizations"
  add_foreign_key "sub_issues", "projects"
  add_foreign_key "sub_issues", "team_members"
  add_foreign_key "sub_issues", "teams"
  add_foreign_key "team_members", "organizations"
  add_foreign_key "team_members", "teams"
  add_foreign_key "teams", "organizations"
end
