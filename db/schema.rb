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

ActiveRecord::Schema.define(:version => 20110616205837) do

  create_table "calls", :force => true do |t|
    t.datetime "calldate",                                  :null => false
    t.string   "clid",        :limit => 80, :default => "", :null => false
    t.string   "src",         :limit => 80, :default => "", :null => false
    t.string   "dst",         :limit => 80, :default => "", :null => false
    t.string   "dcontext",    :limit => 80, :default => "", :null => false
    t.string   "channel",     :limit => 80, :default => "", :null => false
    t.string   "dstchannel",  :limit => 80, :default => "", :null => false
    t.string   "lastapp",     :limit => 80, :default => "", :null => false
    t.string   "lastdata",    :limit => 80, :default => "", :null => false
    t.integer  "duration",                  :default => 0,  :null => false
    t.integer  "billsec",                   :default => 0,  :null => false
    t.string   "disposition", :limit => 45, :default => "", :null => false
    t.integer  "amaflags",                  :default => 0,  :null => false
    t.string   "accountcode", :limit => 20, :default => "", :null => false
    t.string   "userfield",                 :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calls", ["accountcode"], :name => "index_calls_on_accountcode", :unique => true
  add_index "calls", ["calldate"], :name => "index_calls_on_calldate", :unique => true
  add_index "calls", ["dst"], :name => "index_calls_on_dst", :unique => true

  create_table "invoices", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
