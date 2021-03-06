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

ActiveRecord::Schema.define(version: 2019_05_31_052745) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "bets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "player"
    t.integer "game"
    t.integer "team"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "processed"
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "team1"
    t.integer "team2"
    t.decimal "winteam1", precision: 4, scale: 2
    t.decimal "winteam2", precision: 4, scale: 2
    t.datetime "matchtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner"
    t.boolean "finished"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "points"
    t.string "pincode"
    t.string "password"
    t.binary "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "device"
    t.string "share_code"
    t.index ["device"], name: "index_players_on_device", unique: true
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["name"], name: "index_players_on_name"
    t.index ["phone"], name: "index_players_on_phone", unique: true
    t.index ["pincode"], name: "index_players_on_pincode"
    t.index ["points"], name: "index_players_on_points"
    t.index ["share_code"], name: "index_players_on_share_code", unique: true
  end

  create_table "rewards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "amount"
    t.integer "rank_start"
    t.integer "rank_end"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "game"
  end

  create_table "supers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_supers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_supers_on_reset_password_token", unique: true
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "rank"
    t.decimal "game_points", precision: 5, scale: 2
    t.boolean "negative"
    t.decimal "run_rate", precision: 6, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "won"
    t.integer "lost"
    t.integer "played"
    t.boolean "last"
    t.integer "nr"
  end

  create_table "terms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
