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

ActiveRecord::Schema.define(version: 20140921050838) do

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
    t.string   "name",         default: "", null: false
    t.integer  "sort",         default: 0,  null: false
    t.integer  "events_count", default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_creators", force: true do |t|
    t.integer "event_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "event_creators", ["event_id"], name: "event_creators_event_id_fk", using: :btree
  add_index "event_creators", ["user_id"], name: "event_creators_user_id_fk", using: :btree

  create_table "event_dates", force: true do |t|
    t.integer  "event_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at",   null: false
    t.boolean  "weekday",  null: false
    t.boolean  "holiday",  null: false
  end

  add_index "event_dates", ["event_id"], name: "index_event_dates_on_event_id", using: :btree
  add_index "event_dates", ["holiday"], name: "index_event_dates_on_holiday", using: :btree
  add_index "event_dates", ["weekday"], name: "index_event_dates_on_weekday", using: :btree

  create_table "event_images", force: true do |t|
    t.integer  "event_id",                 null: false
    t.integer  "medium_id",                null: false
    t.string   "title",       default: "", null: false
    t.text     "description"
    t.integer  "sort",        default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_images", ["event_id"], name: "index_event_images_on_event_id", using: :btree
  add_index "event_images", ["medium_id"], name: "event_images_medium_id_fk", using: :btree

  create_table "event_organizers", force: true do |t|
    t.integer "event_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "event_organizers", ["event_id"], name: "event_organizers_event_id_fk", using: :btree
  add_index "event_organizers", ["user_id"], name: "event_organizers_user_id_fk", using: :btree

  create_table "events", force: true do |t|
    t.integer  "area_id",                              null: false
    t.integer  "thumbnail_id"
    t.string   "title",                   default: "", null: false
    t.text     "content"
    t.integer  "status",        limit: 1, default: 0,  null: false
    t.string   "location_name",           default: "", null: false
    t.integer  "prefecture",    limit: 1,              null: false
    t.string   "postal_code",   limit: 7
    t.string   "address",                 default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["area_id"], name: "index_events_on_area_id", using: :btree
  add_index "events", ["thumbnail_id"], name: "events_thumbnail_id_fk", using: :btree

  create_table "features", force: true do |t|
    t.integer  "status",     limit: 1, default: 0,  null: false
    t.string   "title",                default: "", null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information", force: true do |t|
    t.integer  "status",     limit: 1, default: 0,  null: false
    t.string   "title",                default: "", null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  add_foreign_key "event_creators", "events", name: "event_creators_event_id_fk", dependent: :delete
  add_foreign_key "event_creators", "users", name: "event_creators_user_id_fk", dependent: :delete

  add_foreign_key "event_dates", "events", name: "event_dates_event_id_fk", dependent: :delete

  add_foreign_key "event_images", "events", name: "event_images_event_id_fk", dependent: :delete
  add_foreign_key "event_images", "media", name: "event_images_medium_id_fk", dependent: :delete

  add_foreign_key "event_organizers", "events", name: "event_organizers_event_id_fk", dependent: :delete
  add_foreign_key "event_organizers", "users", name: "event_organizers_user_id_fk", dependent: :delete

  add_foreign_key "events", "areas", name: "events_area_id_fk", dependent: :delete
  add_foreign_key "events", "media", name: "events_thumbnail_id_fk", column: "thumbnail_id", dependent: :nullify

  add_foreign_key "taggings", "tags", name: "taggings_tag_id_fk", dependent: :delete

  add_foreign_key "user_accounts", "users", name: "user_accounts_user_id_fk", dependent: :delete

  add_foreign_key "users", "media", name: "users_avatar_id_fk", column: "avatar_id", dependent: :nullify

end
