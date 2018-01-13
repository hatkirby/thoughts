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

ActiveRecord::Schema.define(version: 20180113211911) do

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "title"
    t.text "body"
    t.string "slug", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokeviewer_abilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pokeviewer_abilities_on_name", unique: true
  end

  create_table "pokeviewer_gift_ribbons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokeviewer_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.boolean "tm", default: false, null: false
    t.integer "move_id"
    t.string "rs_description"
    t.string "frlg_description"
    t.string "emerald_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id"], name: "index_pokeviewer_items_on_move_id"
  end

  create_table "pokeviewer_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokeviewer_moves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.integer "pp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "move_type", null: false
    t.string "rs_description", null: false
    t.string "frlg_description", null: false
    t.string "emerald_description"
    t.index ["name"], name: "index_pokeviewer_moves_on_name", unique: true
  end

  create_table "pokeviewer_pokemon", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "uuid", null: false
    t.integer "trainer_id"
    t.string "key"
    t.string "ot_name", null: false
    t.integer "ot_number", null: false
    t.string "met_type", null: false
    t.integer "met_level"
    t.boolean "shiny", default: false, null: false
    t.string "nature", null: false
    t.string "gender", null: false
    t.boolean "second_ability", null: false
    t.string "unown_letter", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ot_gender", default: "", null: false
    t.integer "box"
    t.integer "slot"
    t.integer "location_id"
    t.string "pokeball", null: false
    t.index ["key"], name: "index_pokeviewer_pokemon_on_key", unique: true
    t.index ["trainer_id"], name: "index_pokeviewer_pokemon_on_trainer_id"
    t.index ["uuid"], name: "index_pokeviewer_pokemon_on_uuid", unique: true
  end

  create_table "pokeviewer_revisions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "pokemon_id", null: false
    t.integer "sequential_id", null: false
    t.string "nickname", null: false
    t.integer "experience", null: false
    t.integer "level", null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "special_attack", null: false
    t.integer "special_defense", null: false
    t.integer "speed", null: false
    t.integer "coolness", null: false
    t.integer "beauty", null: false
    t.integer "cuteness", null: false
    t.integer "smartness", null: false
    t.integer "toughness", null: false
    t.integer "sheen", null: false
    t.integer "item_id"
    t.integer "move_1_id", null: false
    t.integer "move_2_id"
    t.integer "move_3_id"
    t.integer "move_4_id"
    t.integer "move_1_pp_bonuses", default: 0, null: false
    t.integer "move_2_pp_bonuses", default: 0, null: false
    t.integer "move_3_pp_bonuses", default: 0, null: false
    t.integer "move_4_pp_bonuses", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cool_ribbons", default: 0, null: false
    t.integer "beauty_ribbons", default: 0, null: false
    t.integer "cute_ribbons", default: 0, null: false
    t.integer "smart_ribbons", default: 0, null: false
    t.integer "tough_ribbons", default: 0, null: false
    t.boolean "champion_ribbon", default: false
    t.boolean "winning_ribbon", default: false
    t.boolean "victory_ribbon", default: false
    t.boolean "artist_ribbon", default: false
    t.boolean "effort_ribbon", default: false
    t.boolean "marine_ribbon", default: false
    t.boolean "land_ribbon", default: false
    t.boolean "sky_ribbon", default: false
    t.boolean "country_ribbon", default: false
    t.boolean "national_ribbon", default: false
    t.boolean "earth_ribbon", default: false
    t.boolean "world_ribbon", default: false
    t.bigint "species_id", null: false
    t.index ["move_1_id"], name: "index_pokeviewer_revisions_on_move_1_id"
    t.index ["move_2_id"], name: "index_pokeviewer_revisions_on_move_2_id"
    t.index ["move_3_id"], name: "index_pokeviewer_revisions_on_move_3_id"
    t.index ["move_4_id"], name: "index_pokeviewer_revisions_on_move_4_id"
    t.index ["pokemon_id", "sequential_id"], name: "index_pokeviewer_revisions_on_pokemon_id_and_sequential_id", unique: true
    t.index ["pokemon_id"], name: "index_pokeviewer_revisions_on_pokemon_id"
    t.index ["species_id"], name: "index_pokeviewer_revisions_on_species_id"
  end

  create_table "pokeviewer_species", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_1", null: false
    t.string "type_2"
    t.integer "ability_1_id", null: false
    t.integer "ability_2_id"
    t.index ["name"], name: "index_pokeviewer_species_on_name", unique: true
  end

  create_table "pokeviewer_trainers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "game", null: false
    t.string "name", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "marine_ribbon_id"
    t.integer "land_ribbon_id"
    t.integer "sky_ribbon_id"
    t.integer "country_ribbon_id"
    t.integer "national_ribbon_id"
    t.integer "earth_ribbon_id"
    t.integer "world_ribbon_id"
    t.string "box_1_name", null: false
    t.string "box_2_name", null: false
    t.string "box_3_name", null: false
    t.string "box_4_name", null: false
    t.string "box_5_name", null: false
    t.string "box_6_name", null: false
    t.string "box_7_name", null: false
    t.string "box_8_name", null: false
    t.string "box_9_name", null: false
    t.string "box_10_name", null: false
    t.string "box_11_name", null: false
    t.string "box_12_name", null: false
    t.string "box_13_name", null: false
    t.string "box_14_name", null: false
    t.index ["country_ribbon_id"], name: "index_pokeviewer_trainers_on_country_ribbon_id"
    t.index ["earth_ribbon_id"], name: "index_pokeviewer_trainers_on_earth_ribbon_id"
    t.index ["land_ribbon_id"], name: "index_pokeviewer_trainers_on_land_ribbon_id"
    t.index ["marine_ribbon_id"], name: "index_pokeviewer_trainers_on_marine_ribbon_id"
    t.index ["name", "number"], name: "index_pokeviewer_trainers_on_name_and_number", unique: true
    t.index ["national_ribbon_id"], name: "index_pokeviewer_trainers_on_national_ribbon_id"
    t.index ["sky_ribbon_id"], name: "index_pokeviewer_trainers_on_sky_ribbon_id"
    t.index ["world_ribbon_id"], name: "index_pokeviewer_trainers_on_world_ribbon_id"
  end

  create_table "records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text "description"
    t.string "recordable_type"
    t.integer "recordable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recordable_type", "recordable_id"], name: "index_records_on_recordable_type_and_recordable_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "login", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pokeviewer_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["pokeviewer_token"], name: "index_users_on_pokeviewer_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pokeviewer_revisions", "pokeviewer_species", column: "species_id"
end
