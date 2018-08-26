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

ActiveRecord::Schema.define(version: 20180826041019) do

  create_table "candidates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "event_id"
    t.datetime "day"
    t.boolean "is_attend"
    t.boolean "is_valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_candidates_on_event_id"
  end

  create_table "event_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "event_id"
    t.bigint "user_id"
    t.string "pass"
    t.boolean "is_pay"
    t.boolean "is_kanji_pay"
    t.integer "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_people_on_event_id"
    t.index ["user_id"], name: "index_event_people_on_user_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "kanji_id"
    t.datetime "dead_line"
    t.boolean "attend_flg"
    t.string "url"
    t.string "place"
    t.integer "total_fee"
    t.string "memo"
    t.boolean "is_valid"
    t.boolean "is_complete"
    t.string "pass"
    t.boolean "is_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kanji_id"], name: "index_events_on_kanji_id"
  end

  create_table "kanjis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_id"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_kanjis_on_user_id"
  end

  create_table "people_dates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "event_person_id"
    t.bigint "candidate_id"
    t.string "memo"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_people_dates_on_candidate_id"
    t.index ["event_person_id"], name: "index_people_dates_on_event_person_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "candidates", "events"
  add_foreign_key "event_people", "events"
  add_foreign_key "event_people", "users"
  add_foreign_key "events", "kanjis"
  add_foreign_key "kanjis", "users"
  add_foreign_key "people_dates", "candidates"
  add_foreign_key "people_dates", "event_people"
end
