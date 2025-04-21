# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_04_16_092406) do
  create_table "company_metrics", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.string "sub_sector"
    t.decimal "market_cap"
    t.decimal "close_price"
    t.decimal "pe_ratio"
    t.decimal "return_on_equity"
    t.decimal "five_year_avg_net_profit_margin"
    t.decimal "return_on_investment"
    t.decimal "five_year_avg_return_on_equity"
    t.decimal "return_on_assets"
    t.decimal "five_year_avg_return_on_assets"
    t.decimal "net_profit_margin"
    t.decimal "roce"
    t.decimal "forward_revenue_growth_1y"
    t.decimal "forward_ebitda_growth_1y"
    t.decimal "forward_eps_growth_1y"
    t.decimal "pb_premium_vs_sector"
    t.decimal "pb_ratio"
    t.decimal "ps_premium_vs_sector"
    t.decimal "ps_ratio"
    t.decimal "ev_to_ebitda_ratio"
    t.decimal "forward_pe_ratio"
    t.decimal "price_to_free_cash_flow"
    t.decimal "enterprise_value"
    t.decimal "price_to_cfo"
    t.decimal "price_to_sales"
    t.decimal "sector_pe"
    t.decimal "current_ratio"
    t.decimal "long_term_debt_to_equity"
    t.decimal "debt_to_equity"
    t.decimal "inventory_turnover_ratio"
    t.decimal "asset_turnover_ratio"
    t.decimal "investing_cash_flow"
    t.decimal "total_current_assets"
    t.decimal "total_debt"
    t.decimal "total_equity"
    t.decimal "free_cash_flow"
    t.decimal "book_value"
    t.decimal "ebitda"
    t.decimal "payout_ratio"
    t.decimal "earnings_per_share"
    t.decimal "pbit"
    t.decimal "total_revenue"
    t.decimal "eps_quarterly"
    t.decimal "ebitda_quarterly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_stocks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "stock_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_user_stocks_on_stock_id"
    t.index ["user_id"], name: "index_user_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
