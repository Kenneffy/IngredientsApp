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

ActiveRecord::Schema.define(version: 20150813145057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ingredients_recipe_id"
  end

  create_table "ingredients_recipes", force: true do |t|
    t.string   "name"
    t.text     "endpoint"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "f2f_recipe_id"
    t.string   "f2f_img_url"
  end

  create_table "ingredients_recipes_users", id: false, force: true do |t|
    t.integer "user_id",               null: false
    t.integer "ingredients_recipe_id", null: false
  end

  create_table "user_tries", force: true do |t|
    t.boolean "try"
    t.integer "user_id"
    t.integer "ingredients_recipe_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "avatar_url"
    t.string   "email"
  end

end
