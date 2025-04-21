class CompanyMetricsController < ApplicationController

    def index
        @company_metrics = CompanyMetric.page(params[:page]).per(20) # 20 per page
    end
    
    def analysis
        binding.pry

        user_prompt = CompanyMetric.find(params[:id]).to_s

        response = Openai::ChatService.new(prompt: user_prompt, system_prompt: "You are a stock anaylist. You look at the financial statement of a company and provide an insight about it, and should one invest into it or not if yes what is the recommended percentage.").call

        @analysis_data = response.split("\n")
    end

    private

    def generate_financial_analysis(data)
        <<~REPORT
          ### Financial Analysis of #{data[:company_name]} (Ticker: #{data[:ticker]})
      
          #### Overview:
          #{data[:company_name]} operates in the #{data[:sector]} sub-sector. With a market cap of ₹#{data[:market_cap]} million and a closing price of ₹#{data[:closing_price]} per share, it holds relevance within the Indian markets. Below are key financial metrics and insights derived from its financial statements.
      
          #### Key Financial Metrics:
          1. **Valuation Ratios**:
          - **P/E Ratio**: #{data[:pe_ratio]}, which is #{data[:pe_comment]}.
          - **PB Ratio**: #{data[:pb_ratio]}, reflects how much investors are willing to pay for ₹1 of book value.
          - **Price/Sales Ratio**: #{data[:ps_ratio]}, #{data[:ps_comment]}.
      
          2. **Profitability**:
          - **Net Profit Margin**: #{data[:net_profit_margin]}%, #{data[:npm_comment]}.
          - **Return on Equity (ROE)**: #{data[:roe]}% with a 5Y average ROE of #{data[:roe_5y]}%, suggesting #{data[:roe_comment]}.
          - **Return on Assets (ROA)**: #{data[:roa]}% reflecting efficiency on asset use.
      
          3. **Growth Metrics**:
          - **1Y Forward Revenue Growth**: #{data[:revenue_growth]}% - #{data[:revenue_growth_comment]}.
          - **1Y Forward EBITDA Growth**: #{data[:ebitda_growth]}% - #{data[:ebitda_growth_comment]}.
          - **1Y Forward EPS Growth**: #{data[:eps_growth]}% - #{data[:eps_growth_comment]}.
      
          4. **Liquidity and Leverage**:
          - **Current Ratio**: #{data[:current_ratio]}, indicating the company is capable of covering its short-term liabilities.
          - **Debt to Equity**: #{data[:debt_to_equity]} and Long-Term Debt to Equity: #{data[:long_term_debt_to_equity]} suggests #{data[:debt_comment]}.
      
          5. **Cash Flow**:
          - **Free Cash Flow**: ₹#{data[:free_cash_flow]} million, #{data[:fcf_comment]}.
          - **Price/Free Cash Flow**: #{data[:price_to_fcf]} - #{data[:price_fcf_comment]}.
      
          #### Investment Insight:
      
          **Conclusion**: #{data[:conclusion]}
      
          **Recommendation**: #{data[:recommendation]}
        REPORT
      end

end
