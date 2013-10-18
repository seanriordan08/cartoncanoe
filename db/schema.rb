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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131017173018) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.decimal  "quantity",   :default => 1.0
    t.integer  "order_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "first_name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "phone_number"
    t.string   "prefix"
    t.string   "last_name"
    t.string   "date_of_delivery"
    t.string   "delivery_time"
    t.string   "city"
    t.string   "zip"
    t.string   "accept_terms"
  end

  create_table "polls", :force => true do |t|
    t.string   "email"
    t.integer  "time"
    t.integer  "money"
    t.integer  "allergy"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.decimal  "price",           :precision => 8, :scale => 2
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "unit_of_measure"
    t.string   "brand"
    t.decimal  "portion_size",    :precision => 8, :scale => 2
    t.string   "priority"
    t.integer  "upc"
    t.integer  "scalable"
    t.integer  "not_for_sale"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
