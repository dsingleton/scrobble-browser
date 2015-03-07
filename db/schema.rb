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

ActiveRecord::Schema.define(version: 20150307212813) do

  create_table "albums", force: true do |t|
    t.string   "name"
    t.string   "mbid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "mbid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrobbles", force: true do |t|
    t.integer  "user_id"
    t.integer  "track_id"
    t.datetime "listened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scrobbles", ["track_id"], name: "index_scrobbles_on_track_id"
  add_index "scrobbles", ["user_id"], name: "index_scrobbles_on_user_id"

  create_table "tracks", force: true do |t|
    t.string   "name"
    t.string   "mbid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
    t.integer  "album_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
