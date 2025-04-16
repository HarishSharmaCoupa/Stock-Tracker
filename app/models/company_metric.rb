class CompanyMetric < ApplicationRecord
    include ActionView::Helpers::NumberHelper
    
    def to_s
        "Company: #{name} (Ticker: #{ticker})\n" +
        "Sub-Sector: #{sub_sector}\n" +
        "Market Cap: #{number_to_currency(market_cap, unit: '₹', precision: 0, delimiter: ',')}\n" +
        "Close Price: ₹#{'%.2f' % close_price}\n" +
        "PE Ratio: #{'%.2f' % pe_ratio}\n" +
        "Return on Equity: #{'%.2f' % return_on_equity}%\n" +
        "5Y Avg Net Profit Margin: #{'%.2f' % five_year_avg_net_profit_margin}%\n" +
        "Return on Investment: #{'%.2f' % return_on_investment}%\n" +
        "5Y Avg Return on Equity: #{'%.2f' % five_year_avg_return_on_equity}%\n" +
        "Return on Assets: #{'%.2f' % return_on_assets}%\n" +
        "5Y Avg Return on Assets: #{'%.2f' % five_year_avg_return_on_assets}%\n" +
        "Net Profit Margin: #{'%.2f' % net_profit_margin}%\n" +
        "ROCE: #{'%.2f' % roce}%\n" +
        "1Y Forward Revenue Growth: #{'%.2f' % forward_revenue_growth_1y}%\n" +
        "1Y Forward EBITDA Growth: #{'%.2f' % forward_ebitda_growth_1y}%\n" +
        "1Y Forward EPS Growth: #{'%.2f' % forward_eps_growth_1y}%\n" +
        "PB Premium vs Sector: #{'%.2f' % pb_premium_vs_sector}%\n" +
        "PB Ratio: #{'%.2f' % pb_ratio}\n" +
        "PS Premium vs Sector: #{'%.2f' % ps_premium_vs_sector}%\n" +
        "PS Ratio: #{'%.2f' % ps_ratio}\n" +
        "EV/EBITDA Ratio: #{'%.2f' % ev_to_ebitda_ratio}\n" +
        "Forward PE Ratio: #{'%.2f' % forward_pe_ratio}\n" +
        "Price / Free Cash Flow: #{'%.2f' % price_to_free_cash_flow}\n" +
        "Enterprise Value: #{number_to_currency(enterprise_value, unit: '₹', precision: 0, delimiter: ',')}\n" +
        "Price / CFO: #{'%.2f' % price_to_cfo}\n" +
        "Price / Sales: #{'%.2f' % price_to_sales}\n" +
        "Sector PE: #{'%.2f' % sector_pe}\n" +
        "Current Ratio: #{'%.2f' % current_ratio}\n" +
        "Long Term Debt to Equity: #{'%.2f' % long_term_debt_to_equity}\n" +
        "Debt to Equity: #{'%.2f' % debt_to_equity}\n" +
        "Inventory Turnover Ratio: #{'%.2f' % inventory_turnover_ratio}\n" +
        "Asset Turnover Ratio: #{'%.2f' % asset_turnover_ratio}\n" +
        "Investing Cash Flow: ₹#{'%.2f' % investing_cash_flow}\n" +
        "Total Current Assets: ₹#{'%.2f' % total_current_assets}\n" +
        "Total Debt: ₹#{'%.2f' % total_debt}\n" +
        "Total Equity: ₹#{'%.2f' % total_equity}\n" +
        "Free Cash Flow: ₹#{'%.2f' % free_cash_flow}\n" +
        "Book Value: ₹#{'%.2f' % book_value}\n" +
        "EBITDA: ₹#{'%.2f' % ebitda}\n" +
        "Payout Ratio: #{'%.2f' % payout_ratio}%\n" +
        "Earnings Per Share: ₹#{'%.2f' % earnings_per_share}\n" +
        "PBIT: ₹#{'%.2f' % pbit}\n" +
        "Total Revenue: ₹#{'%.2f' % total_revenue}\n" +
        "EPS (Q): ₹#{'%.2f' % eps_quarterly}\n" +
        "EBITDA (Q): ₹#{'%.2f' % ebitda_quarterly}\n"
      end
end
