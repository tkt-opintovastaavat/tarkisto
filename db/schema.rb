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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120208225850) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "attendances", :force => true do |t|
    t.integer  "instance_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "code_snippets", :force => true do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_theme_questions", :force => true do |t|
    t.integer "course_theme_id"
    t.integer "question_id"
  end

  create_table "course_themes", :force => true do |t|
    t.integer "theme_id"
    t.string  "description_fi"
    t.string  "description_en"
    t.string  "description_se"
    t.integer "course_id"
  end

  create_table "courses", :force => true do |t|
    t.integer  "code"
    t.string   "name_fi"
    t.string   "name_se"
    t.string   "name_en"
    t.integer  "level_id"
    t.integer  "credits"
    t.integer  "replaced_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_builders", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "user_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", :force => true do |t|
    t.integer  "type_id"
    t.integer  "course_id"
    t.string   "lecturer"
    t.integer  "maximum_points"
    t.boolean  "public",         :default => true
    t.boolean  "published",      :default => false
    t.date     "date"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question_image_file_name"
    t.string   "question_image_content_type"
    t.integer  "question_image_file_size"
    t.string   "file"
  end

  create_table "instances", :force => true do |t|
    t.integer  "course_id"
    t.integer  "period"
    t.integer  "year"
    t.string   "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecturers", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.string "name_fi"
    t.string "name_se"
    t.string "name_en"
  end

  create_table "questions", :force => true do |t|
    t.integer  "number"
    t.text     "description"
    t.text     "name"
    t.integer  "points"
    t.integer  "exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shortcuts", :force => true do |t|
    t.string  "name"
    t.integer "course_id"
  end

  create_table "themes", :force => true do |t|
    t.string "name_fi"
    t.string "name_en"
    t.string "name_se"
  end

  create_table "types", :force => true do |t|
    t.string "name_fi"
    t.string "name_en"
    t.string "name_se"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "student_id"
    t.string   "language"
    t.boolean  "access"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
