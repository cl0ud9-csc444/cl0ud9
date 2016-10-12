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

ActiveRecord::Schema.define(version: 20161012014530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cloud9_people", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "permissions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["person_id"], name: "index_cloud9_people_on_person_id", using: :btree
  end

  create_table "golf_course_people", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "golf_course_id"
    t.string   "permissions"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["golf_course_id"], name: "index_golf_course_people_on_golf_course_id", using: :btree
    t.index ["person_id"], name: "index_golf_course_people_on_person_id", using: :btree
  end

  create_table "golf_courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "phone"
    t.integer  "addrStreetNum"
    t.integer  "addrUnitNum"
    t.string   "addrStreetName"
    t.string   "addrCity"
    t.string   "addrPostalCode"
    t.string   "addrCountry"
    t.string   "logoLink"
    t.string   "websiteURL"
    t.string   "email"
    t.integer  "capacity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "hostName"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizers", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "tournament_id"
    t.string   "permissions"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["person_id"], name: "index_organizers_on_person_id", using: :btree
    t.index ["tournament_id"], name: "index_organizers_on_tournament_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "fName"
    t.string   "lName"
    t.date     "birthDate"
    t.string   "email"
    t.boolean  "allowUserEmails"
    t.string   "pword"
    t.string   "profilePicLink"
    t.string   "twitterLink"
    t.string   "fbLink"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "photoLink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "tournament_id"
    t.integer  "team_id"
    t.boolean  "checkedIn"
    t.integer  "ticket_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["person_id"], name: "index_players_on_person_id", using: :btree
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
    t.index ["ticket_id"], name: "index_players_on_ticket_id", using: :btree
    t.index ["tournament_id"], name: "index_players_on_tournament_id", using: :btree
  end

  create_table "scheduled_events", force: :cascade do |t|
    t.integer  "tournament_id"
    t.time     "time"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_scheduled_events_on_tournament_id", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "tournament_id"
    t.string   "type"
    t.string   "logoLink"
    t.string   "websiteURL"
    t.string   "twitterLink"
    t.string   "fbLink"
    t.string   "snapchatHandle"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["person_id"], name: "index_sponsors_on_person_id", using: :btree
    t.index ["tournament_id"], name: "index_sponsors_on_tournament_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "numPlayers"
    t.time     "teeTime"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_teams_on_tournament_id", using: :btree
  end

  create_table "ticket_types", force: :cascade do |t|
    t.integer  "tournament_id"
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_ticket_types_on_tournament_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.string   "QRCodeLink"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.text     "shortDesc"
    t.integer  "numGuests"
    t.boolean  "privateURL"
    t.string   "microSiteURL"
    t.string   "logoLink"
    t.string   "language"
    t.string   "currency"
    t.string   "timeZone"
    t.integer  "ticketsLeft"
    t.datetime "registerStart"
    t.datetime "registerEnd"
    t.integer  "host_id"
    t.integer  "golf_course_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "tournamentDate"
    t.index ["golf_course_id"], name: "index_tournaments_on_golf_course_id", using: :btree
    t.index ["host_id"], name: "index_tournaments_on_host_id", using: :btree
  end

  create_table "unscheduled_events", force: :cascade do |t|
    t.integer  "tournament_id"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_unscheduled_events_on_tournament_id", using: :btree
  end

  add_foreign_key "cloud9_people", "people"
  add_foreign_key "golf_course_people", "golf_courses"
  add_foreign_key "golf_course_people", "people"
  add_foreign_key "organizers", "people"
  add_foreign_key "organizers", "tournaments"
  add_foreign_key "players", "people"
  add_foreign_key "players", "teams"
  add_foreign_key "players", "tickets"
  add_foreign_key "players", "tournaments"
  add_foreign_key "scheduled_events", "tournaments"
  add_foreign_key "sponsors", "people"
  add_foreign_key "sponsors", "tournaments"
  add_foreign_key "teams", "tournaments"
  add_foreign_key "ticket_types", "tournaments"
  add_foreign_key "tickets", "ticket_types"
  add_foreign_key "tournaments", "golf_courses"
  add_foreign_key "tournaments", "hosts"
  add_foreign_key "unscheduled_events", "tournaments"
end