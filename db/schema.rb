# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 100) do

  create_table "articles", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "body"
    t.datetime "created_on"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "contacts", :force => true do |t|
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.text     "about"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.string   "added_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_name"
    t.integer  "contact_no"
    t.string   "contact_url"
    t.boolean  "all_day_event"
    t.integer  "recurring_type"
  end

  create_table "events_tags", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "tag_id"
  end

  create_table "images", :force => true do |t|
    t.string "name"
    t.string "description"
    t.string "extension"
  end

  create_table "joins", :force => true do |t|
  end

  create_table "papermaps", :force => true do |t|
  end

  create_table "photos", :force => true do |t|
    t.string "description"
    t.string "content_type"
    t.string "filename"
    t.binary "binary_data",    :limit => 16777215
    t.binary "thumbnail_data", :limit => 16777215
  end

  create_table "photos_places", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "place_id"
  end

  create_table "places", :force => true do |t|
    t.string  "name"
    t.text    "about"
    t.float   "longitude"
    t.float   "latitude"
    t.integer "category_id"
    t.string  "opening_times"
    t.string  "contact"
    t.string  "telephone"
    t.string  "email"
    t.string  "url"
    t.string  "address_1"
    t.string  "address_2"
    t.string  "address_3"
    t.string  "postcode"
    t.string  "town"
  end

  add_index "places", ["category_id"], :name => "index_places_on_category_id"

  create_table "places_tags", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "tag_id"
  end

  create_table "postcodes", :force => true do |t|
    t.string "postcode"
    t.string "longitude"
    t.string "latitude"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  add_foreign_key "places", ["category_id"], "categories", ["id"], :name => "places_fk_cat"

end
