class CreateCompanyMetrics < ActiveRecord::Migration[7.2]
  def change
    create_table :company_metrics do |t|
      t.string :name
      t.string :ticker
      t.string :sub_sector
      t.decimal :market_cap
      t.decimal :close_price
      t.decimal :pe_ratio
      t.decimal :return_on_equity
      t.decimal :five_year_avg_net_profit_margin
      t.decimal :return_on_investment
      t.decimal :five_year_avg_return_on_equity
      t.decimal :return_on_assets
      t.decimal :five_year_avg_return_on_assets
      t.decimal :net_profit_margin
      t.decimal :roce
      t.decimal :forward_revenue_growth_1y
      t.decimal :forward_ebitda_growth_1y
      t.decimal :forward_eps_growth_1y
      t.decimal :pb_premium_vs_sector
      t.decimal :pb_ratio
      t.decimal :ps_premium_vs_sector
      t.decimal :ps_ratio
      t.decimal :ev_to_ebitda_ratio
      t.decimal :forward_pe_ratio
      t.decimal :price_to_free_cash_flow
      t.decimal :enterprise_value
      t.decimal :price_to_cfo
      t.decimal :price_to_sales
      t.decimal :sector_pe
      t.decimal :current_ratio
      t.decimal :long_term_debt_to_equity
      t.decimal :debt_to_equity
      t.decimal :inventory_turnover_ratio
      t.decimal :asset_turnover_ratio
      t.decimal :investing_cash_flow
      t.decimal :total_current_assets
      t.decimal :total_debt
      t.decimal :total_equity
      t.decimal :free_cash_flow
      t.decimal :book_value
      t.decimal :ebitda
      t.decimal :payout_ratio
      t.decimal :earnings_per_share
      t.decimal :pbit
      t.decimal :total_revenue
      t.decimal :eps_quarterly
      t.decimal :ebitda_quarterly

      t.timestamps
    end
  end
end
