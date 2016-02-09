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

ActiveRecord::Schema.define(:version => 20140516131142) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chronicler_documents", :force => true do |t|
    t.string "name"
    t.string "document"
  end

  create_table "chronicler_images", :force => true do |t|
    t.string "name"
    t.string "image"
  end

  create_table "competition_entries", :force => true do |t|
    t.integer  "competition_id"
    t.text     "answer"
    t.string   "name"
    t.string   "postcode"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.text     "message"
    t.string   "prize_name"
    t.text     "prize_description"
    t.string   "prize_image"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "question"
    t.integer  "campaign_id"
  end

  create_table "game_cards", :force => true do |t|
    t.string   "name"
    t.string   "game_category"
    t.string   "category"
    t.integer  "units"
    t.integer  "calories"
    t.text     "fact"
    t.string   "front_image"
    t.string   "back_image"
    t.boolean  "display"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "game_instances", :force => true do |t|
    t.string   "auth_token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_rules", :force => true do |t|
    t.string   "game"
    t.text     "rules"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "fact"
  end

  create_table "leaderboard_entries", :force => true do |t|
    t.string   "nickname"
    t.string   "email"
    t.integer  "score"
    t.string   "location"
    t.string   "game"
    t.string   "competition"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "game_instance_id"
  end

  create_table "manticore_administrators", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_send_at"
  end

  create_table "willow_branches", :force => true do |t|
    t.string  "tree"
    t.string  "name"
    t.integer "position",              :default => 0
    t.string  "ancestry"
    t.integer "ancestry_depth",        :default => 0
    t.string  "positions_depth_cache"
    t.integer "leaf_id"
    t.string  "leaf_type"
    t.string  "access_key"
    t.boolean "sturdy",                :default => false
    t.boolean "can_have_children",     :default => false
    t.boolean "primary",               :default => false
  end

  add_index "willow_branches", ["ancestry"], :name => "index_willow_branches_on_ancestry"

  create_table "willow_leaves", :force => true do |t|
    t.string "name"
    t.string "route"
    t.string "type"
  end

end
