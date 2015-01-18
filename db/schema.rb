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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150117033018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_tokens", force: true do |t|
    t.string   "token"
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_tokens", ["group_id"], name: "index_email_tokens_on_group_id", using: :btree
  add_index "email_tokens", ["user_id"], name: "index_email_tokens_on_user_id", using: :btree

  create_table "friend_request_registrations", force: true do |t|
    t.integer  "user_id",                       null: false
    t.integer  "request_from_user", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_request_registrations", ["user_id"], name: "index_friend_request_registrations_on_user_id", using: :btree

  create_table "friends", force: true do |t|
    t.integer  "user_id",         null: false
    t.string   "friend_user_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "group_members", force: true do |t|
    t.integer  "group_id",                   null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "owner",      default: false
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id", using: :btree
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_cards", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "type"
    t.integer  "point"
    t.date     "schedule_end_date"
    t.integer  "user_id",           null: false
    t.integer  "group_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_cards", ["group_id"], name: "index_job_cards_on_group_id", using: :btree
  add_index "job_cards", ["user_id"], name: "index_job_cards_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "nickname"
    t.string   "access_token"
    t.string   "secret_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "uid",          default: "", null: false
  end

  add_index "users", ["provider", "email"], name: "index_users_on_provider_and_email", using: :btree

end
