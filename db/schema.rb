# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_15_204350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.text "description"
    t.text "professional_background"
    t.string "github_link"
    t.string "gitlab_link"
    t.string "twitter_link"
    t.string "linkedin_link"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "badge_media", force: :cascade do |t|
    t.string "aws_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "badge_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "badges", force: :cascade do |t|
    t.bigint "badge_type_id"
    t.bigint "project_competition_id"
    t.bigint "badge_media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_media_id"], name: "index_badges_on_badge_media_id"
    t.index ["badge_type_id"], name: "index_badges_on_badge_type_id"
    t.index ["project_competition_id"], name: "index_badges_on_project_competition_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "collaborations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_collaborations_on_project_id"
    t.index ["role_id"], name: "index_collaborations_on_role_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "comment_answer_upvotes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_answer_id"], name: "index_comment_answer_upvotes_on_comment_answer_id"
    t.index ["user_id"], name: "index_comment_answer_upvotes_on_user_id"
  end

  create_table "comment_answers", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_answers_on_comment_id"
    t.index ["user_id"], name: "index_comment_answers_on_user_id"
  end

  create_table "comment_upvotes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_upvotes_on_comment_id"
    t.index ["user_id"], name: "index_comment_upvotes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_comments_on_project_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_donations_on_project_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "language_media", force: :cascade do |t|
    t.string "data_type"
    t.string "aws_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.bigint "language_media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_media_id"], name: "index_languages_on_language_media_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "aws_link"
    t.bigint "media_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type_id"], name: "index_media_on_media_type_id"
  end

  create_table "media_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_project_categories_on_category_id"
    t.index ["project_id"], name: "index_project_categories_on_project_id"
  end

  create_table "project_competition_upvotes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_competition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_competition_id"], name: "index_project_competition_upvotes_on_project_competition_id"
    t.index ["user_id"], name: "index_project_competition_upvotes_on_user_id"
  end

  create_table "project_competitions", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "competition_id"
    t.integer "upvote_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_project_competitions_on_competition_id"
    t.index ["project_id"], name: "index_project_competitions_on_project_id"
  end

  create_table "project_languages", force: :cascade do |t|
    t.bigint "language_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_project_languages_on_language_id"
    t.index ["project_id"], name: "index_project_languages_on_project_id"
  end

  create_table "project_media", force: :cascade do |t|
    t.bigint "media_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_id"], name: "index_project_media_on_media_id"
    t.index ["project_id"], name: "index_project_media_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "short_description"
    t.text "long_description"
    t.bigint "value_of_project"
    t.integer "money_earned"
    t.integer "number_of_developpers_on_project"
    t.integer "daily_time_spent_on_project_per_developper"
    t.string "link_of_github"
    t.boolean "is_complete"
    t.string "license"
    t.boolean "is_validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.text "description"
    t.text "professional_background"
    t.string "github_link"
    t.string "gitlab_link"
    t.string "twitter_link"
    t.string "linkedin_link"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
