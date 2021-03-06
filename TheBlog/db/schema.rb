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

ActiveRecord::Schema.define(version: 20150228094143) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image"
  end

  add_index "articles", ["text"], name: "index_articles_on_text"
  add_index "articles", ["title"], name: "index_articles_on_title"

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "article_id",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_on_comments", force: :cascade do |t|
    t.text    "field"
    t.integer "user_id"
    t.integer "comment_id"
  end

  add_index "comment_on_comments", ["comment_id"], name: "index_comment_on_comments_on_comment_id"
  add_index "comment_on_comments", ["user_id"], name: "index_comment_on_comments_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.text    "body"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "article_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
