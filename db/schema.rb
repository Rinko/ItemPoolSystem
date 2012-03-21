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

ActiveRecord::Schema.define(:version => 20120316103046) do

  create_table "administrators", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answered_question_infos", :force => true do |t|
    t.integer  "student_id"
    t.integer  "question_id"
    t.boolean  "right_or_wrong"
    t.string   "wrong_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answered_question_infos", ["question_id"], :name => "index_answered_question_infos_on_question_id"
  add_index "answered_question_infos", ["student_id"], :name => "index_answered_question_infos_on_student_id"

  create_table "books", :force => true do |t|
    t.integer  "publisher"
    t.integer  "subject"
    t.integer  "grade"
    t.integer  "term"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_point_infos", :force => true do |t|
    t.integer  "student_id"
    t.integer  "knowledge_point_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_point_infos", ["knowledge_point_id"], :name => "index_knowledge_point_infos_on_knowledge_point_id"
  add_index "knowledge_point_infos", ["student_id"], :name => "index_knowledge_point_infos_on_student_id"

  create_table "knowledge_points", :force => true do |t|
    t.text     "specific"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_points_questions", :id => false, :force => true do |t|
    t.integer "knowledge_point_id"
    t.integer "question_id"
  end

  create_table "knowledge_points_structures", :id => false, :force => true do |t|
    t.integer "knowledge_point_id"
    t.integer "structure_id"
  end

  create_table "parameters", :force => true do |t|
    t.integer  "key"
    t.string   "value"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parameters", ["parent_id"], :name => "index_parameters_on_parent_id"

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.string   "resource_ids"
    t.integer  "difficulty"
    t.boolean  "if_judge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "structures", :force => true do |t|
    t.integer  "book_id"
    t.integer  "unit"
    t.integer  "chapter"
    t.string   "title"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  add_index "structures", ["book_id"], :name => "index_structures_on_book_id"
  add_index "structures", ["parent_id"], :name => "index_structures_on_parent_id"

  create_table "structures_students", :id => false, :force => true do |t|
    t.integer "structure_id"
    t.integer "student_id"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
