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

ActiveRecord::Schema.define(version: 2019_03_29_045719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "position"
    t.datetime "dispatch_time"
    t.datetime "arrival_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name_id"
    t.string "last_name_id"
    t.string "middle_name_id"
    t.bigint "passport_details_id"
    t.bigint "train_id"
    t.bigint "start_station_id"
    t.bigint "end_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["first_name_id"], name: "index_tickets_on_first_name_id"
    t.index ["last_name_id"], name: "index_tickets_on_last_name_id"
    t.index ["middle_name_id"], name: "index_tickets_on_middle_name_id"
    t.index ["passport_details_id"], name: "index_tickets_on_passport_details_id"
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_station_id"
    t.bigint "route_id"
    t.boolean "boolean_id", default: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
    t.index ["ticket_id"], name: "index_trains_on_ticket_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wagons", force: :cascade do |t|
    t.integer "number"
    t.integer "seats"
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.bigint "train_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "type"], name: "index_wagons_on_id_and_type"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
