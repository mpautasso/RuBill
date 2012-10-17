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

ActiveRecord::Schema.define(:version => 20110819125847) do

  create_table "csv_files", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "imported"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "csv_file_name"
    t.string   "csv_content_type"
    t.integer  "csv_file_size"
    t.datetime "csv_updated_at"
  end

  create_table "devices", :force => true do |t|
    t.integer  "user_id"
    t.string   "exten"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "failed_calls", :force => true do |t|
    t.datetime "calldate"
    t.string   "clid",        :limit => 80, :default => ""
    t.string   "src",         :limit => 80, :default => ""
    t.string   "dst",         :limit => 80, :default => ""
    t.string   "dcontext",    :limit => 80, :default => ""
    t.string   "channel",     :limit => 80, :default => ""
    t.string   "dstchannel",  :limit => 80, :default => ""
    t.string   "lastapp",     :limit => 80, :default => ""
    t.string   "lastdata",    :limit => 80, :default => ""
    t.integer  "duration",                  :default => 0
    t.integer  "billsec",                   :default => 0
    t.string   "disposition", :limit => 45, :default => ""
    t.integer  "amaflags",                  :default => 0
    t.string   "accountcode", :limit => 20, :default => ""
    t.string   "userfield",                 :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  create_table "incomming_calls", :force => true do |t|
    t.datetime "calldate"
    t.string   "clid",        :limit => 80, :default => ""
    t.string   "src",         :limit => 80, :default => ""
    t.string   "dst",         :limit => 80, :default => ""
    t.string   "dcontext",    :limit => 80, :default => ""
    t.string   "channel",     :limit => 80, :default => ""
    t.string   "dstchannel",  :limit => 80, :default => ""
    t.string   "lastapp",     :limit => 80, :default => ""
    t.string   "lastdata",    :limit => 80, :default => ""
    t.integer  "duration",                  :default => 0
    t.integer  "billsec",                   :default => 0
    t.string   "disposition", :limit => 45, :default => ""
    t.integer  "amaflags",                  :default => 0
    t.string   "accountcode", :limit => 20, :default => ""
    t.string   "userfield",                 :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "from"
    t.datetime "to"
    t.decimal  "total",      :precision => 6, :scale => 2, :default => 0.0, :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "reference_type"
    t.integer  "reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
    t.string   "description"
  end

  create_table "outgoing_calls", :force => true do |t|
    t.datetime "calldate"
    t.string   "clid",        :limit => 80,                               :default => ""
    t.string   "src",         :limit => 80,                               :default => ""
    t.string   "dst",         :limit => 80,                               :default => ""
    t.string   "dcontext",    :limit => 80,                               :default => ""
    t.string   "channel",     :limit => 80,                               :default => ""
    t.string   "dstchannel",  :limit => 80,                               :default => ""
    t.string   "lastapp",     :limit => 80,                               :default => ""
    t.string   "lastdata",    :limit => 80,                               :default => ""
    t.integer  "duration",                                                :default => 0
    t.integer  "billsec",                                                 :default => 0
    t.string   "disposition", :limit => 45,                               :default => ""
    t.integer  "amaflags",                                                :default => 0
    t.string   "accountcode", :limit => 20,                               :default => ""
    t.string   "userfield",                                               :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost",                      :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.integer  "invoice_id"
    t.integer  "rate_id"
  end

  create_table "rates", :force => true do |t|
    t.string   "prefix"
    t.integer  "initial_time"
    t.decimal  "initial_cost",  :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.integer  "interval_time"
    t.decimal  "interval_cost", :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
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
    t.string   "name"
    t.string   "last_name"
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
