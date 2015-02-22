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

ActiveRecord::Schema.define(version: 20140921081640) do

  create_table "admin_user_accounts", force: true do |t|
    t.integer  "admin_user_id",                       null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_user_accounts", ["admin_user_id"], name: "index_admin_user_accounts_on_admin_user_id", using: :btree
  add_index "admin_user_accounts", ["email"], name: "index_admin_user_accounts_on_email", unique: true, using: :btree
  add_index "admin_user_accounts", ["reset_password_token"], name: "index_admin_user_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "admin_users", force: true do |t|
    t.integer  "avatar_id"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", force: true do |t|
    t.string  "name",         default: "", null: false
    t.integer "events_count", default: 0,  null: false
  end

  create_table "event_images", force: true do |t|
    t.integer  "event_id",                 null: false
    t.integer  "image_id",                 null: false
    t.string   "title",       default: "", null: false
    t.text     "description"
    t.integer  "sort",        default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_images", ["event_id"], name: "index_event_images_on_event_id", using: :btree
  add_index "event_images", ["image_id"], name: "event_images_image_id_fk", using: :btree

  create_table "event_organizers", force: true do |t|
    t.integer "event_id",     null: false
    t.integer "organizer_id", null: false
  end

  add_index "event_organizers", ["event_id"], name: "event_organizers_event_id_fk", using: :btree
  add_index "event_organizers", ["organizer_id"], name: "event_organizers_organizer_id_fk", using: :btree

  create_table "event_schedules", force: true do |t|
    t.integer "event_id",   null: false
    t.date    "start_date", null: false
    t.date    "end_date",   null: false
    t.time    "start_time", null: false
    t.time    "end_time",   null: false
    t.boolean "weekday",    null: false
    t.boolean "holiday",    null: false
  end

  add_index "event_schedules", ["event_id"], name: "index_event_schedules_on_event_id", using: :btree
  add_index "event_schedules", ["holiday"], name: "index_event_schedules_on_holiday", using: :btree
  add_index "event_schedules", ["weekday"], name: "index_event_schedules_on_weekday", using: :btree

  create_table "events", force: true do |t|
    t.integer  "area_id",                                  null: false
    t.integer  "thumbnail_id"
    t.string   "title",                       default: "", null: false
    t.text     "content"
    t.integer  "status",            limit: 1, default: 0,  null: false
    t.integer  "prefecture",        limit: 1,              null: false
    t.string   "address_1",                   default: "", null: false
    t.string   "address_2",                   default: "", null: false
    t.string   "address_code_1",    limit: 8, default: "", null: false
    t.string   "address_code_2",    limit: 8, default: "", null: false
    t.string   "address_code_3",    limit: 8, default: "", null: false
    t.string   "address_code_4",    limit: 8, default: "", null: false
    t.string   "address_code_5",    limit: 8, default: "", null: false
    t.string   "address_code_6",    limit: 8, default: "", null: false
    t.string   "address_code_7",    limit: 8, default: "", null: false
    t.string   "address_code_8",    limit: 8, default: "", null: false
    t.integer  "address_code_size", limit: 1, default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["address_code_1", "address_code_2", "address_code_3", "address_code_4", "address_code_5", "address_code_6", "address_code_7", "address_code_8"], name: "events_address_codes", using: :btree
  add_index "events", ["area_id"], name: "index_events_on_area_id", using: :btree
  add_index "events", ["prefecture"], name: "index_events_on_prefecture", using: :btree
  add_index "events", ["thumbnail_id"], name: "events_thumbnail_id_fk", using: :btree

  create_table "media", force: true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "thumbnail_id"
    t.integer  "kind",         limit: 1, default: 0,  null: false
    t.integer  "status",       limit: 1, default: 0,  null: false
    t.string   "title",                  default: "", null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "taggings", force: true do |t|
    t.integer "tag_id",        null: false
    t.integer "taggable_id",   null: false
    t.string  "taggable_type", null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name",           default: "", null: false
    t.integer "taggings_count", default: 0,  null: false
  end

  create_table "user_accounts", force: true do |t|
    t.integer  "user_id",                             null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_accounts", ["email"], name: "index_user_accounts_on_email", unique: true, using: :btree
  add_index "user_accounts", ["reset_password_token"], name: "index_user_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "user_accounts", ["user_id"], name: "index_user_accounts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "avatar_id"
    t.string   "name",                 null: false
    t.text     "profile"
    t.integer  "role",       limit: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["avatar_id"], name: "users_avatar_id_fk", using: :btree

  add_foreign_key "admin_user_accounts", "admin_users", name: "admin_user_accounts_admin_user_id_fk", dependent: :delete

  add_foreign_key "event_images", "events", name: "event_images_event_id_fk", dependent: :delete
  add_foreign_key "event_images", "media", name: "event_images_image_id_fk", column: "image_id", dependent: :delete

  add_foreign_key "event_organizers", "events", name: "event_organizers_event_id_fk", dependent: :delete
  add_foreign_key "event_organizers", "users", name: "event_organizers_organizer_id_fk", column: "organizer_id", dependent: :delete

  add_foreign_key "event_schedules", "events", name: "event_schedules_event_id_fk", dependent: :delete

  add_foreign_key "events", "areas", name: "events_area_id_fk", dependent: :delete
  add_foreign_key "events", "media", name: "events_thumbnail_id_fk", column: "thumbnail_id", dependent: :nullify

  add_foreign_key "taggings", "tags", name: "taggings_tag_id_fk", dependent: :delete

  add_foreign_key "user_accounts", "users", name: "user_accounts_user_id_fk", dependent: :delete

  add_foreign_key "users", "media", name: "users_avatar_id_fk", column: "avatar_id", dependent: :nullify

end
