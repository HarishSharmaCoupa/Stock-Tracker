require 'finnhub_ruby'

FinnhubRuby.configure do |config|
#   config.api_key['api_key'] = ENV['FINNHUB_API_KEY']
config.api_key['api_key'] = Rails.application.credentials.finhub[:FINNHUB_API_KEY]
end