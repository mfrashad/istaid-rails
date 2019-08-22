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

ActiveRecord::Schema.define(version: 2019_01_14_145744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "model_type", default: 0
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.integer "post_id"
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "sort"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "summary"
    t.string "thumbnail"
    t.integer "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.datetime "published_at"
    t.string "slug"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["gallery_id"], name: "index_events_on_gallery_id"
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "galleries", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.string "slug"
    t.index ["slug"], name: "index_galleries_on_slug", unique: true
  end

  create_table "gallery_images", id: :serial, force: :cascade do |t|
    t.string "image"
    t.string "caption"
    t.integer "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image_url"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
    t.string "summary"
    t.datetime "published_at"
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "static_pages", id: :serial, force: :cascade do |t|
    t.text "body"
    t.string "name"
    t.string "slug"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "thumbnail"
    t.integer "user_id"
    t.string "youtube_id"
    t.string "youtube_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.string "slug"
    t.index ["slug"], name: "index_videos_on_slug", unique: true
  end

  add_foreign_key "events", "galleries"
end
