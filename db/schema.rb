# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130114113504) do

  create_table "questions", :force => true do |t|
    t.integer  "number"
    t.integer  "subquestion"
    t.string   "themecode"
    t.string   "selectioncount"
    t.string   "answer"
    t.string   "svg"
    t.string   "pdf"
    t.string   "png"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "setofsubyears", :force => true do |t|
    t.string   "subject"
    t.string   "year"
    t.boolean  "available"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "themes", :force => true do |t|
    t.string   "themecode"
    t.string   "maintheme"
    t.string   "subtheme"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end