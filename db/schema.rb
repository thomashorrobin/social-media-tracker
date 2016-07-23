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

ActiveRecord::Schema.define(version: 20160721082656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_call_logs", force: :cascade do |t|
    t.string   "call_description"
    t.datetime "call_date_time"
    t.boolean  "successful"
    t.string   "end_point_path"
    t.string   "human_readable_id"
    t.string   "static_id"
    t.integer  "records_inserted"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "fb_page_snapshots", force: :cascade do |t|
    t.integer  "fb_page_id"
    t.date     "snapshot_date"
    t.integer  "page_likes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "fb_page_snapshots", ["fb_page_id"], name: "index_fb_page_snapshots_on_fb_page_id", using: :btree

  create_table "fb_pages", force: :cascade do |t|
    t.string   "page_id"
    t.string   "page_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitter_account_snapshots", force: :cascade do |t|
    t.integer  "followers_count"
    t.integer  "following_count"
    t.integer  "like_count"
    t.integer  "tweets"
    t.integer  "twitter_account_id"
    t.date     "snapshot_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "twitter_account_snapshots", ["snapshot_date", "twitter_account_id"], name: "index_twitter_account_snapshots_on_snapshot_date", unique: true, using: :btree
  add_index "twitter_account_snapshots", ["twitter_account_id"], name: "index_twitter_account_snapshots_on_twitter_account_id", using: :btree

  create_table "twitter_accounts", force: :cascade do |t|
    t.string   "username"
    t.string   "twitter_id"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "fb_page_snapshots", "fb_pages"
  add_foreign_key "twitter_account_snapshots", "twitter_accounts"
end
