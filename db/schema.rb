# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110917093148) do

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
  end

end
