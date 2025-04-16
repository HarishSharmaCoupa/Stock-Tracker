require 'capybara/rails'
require 'selenium/webdriver'
require 'webdrivers/chromedriver'

# config/initializers/capybara_selenium.rb or wherever you configure Capybara driver
 
Capybara.register_driver :selenium_chrome do |app|
  # Set the path to the chromedriver binary using ChromeService
  chromedriver_path = '/opt/homebrew/bin/chromedriver'  # Update this to the actual location of chromedriver

  # Set the download directory
  download_dir = Rails.root.join('tmp', 'downloads')

  # Configure Chrome options
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_preference(:download, default_directory: download_dir)
#   options.add_argument('--headless')  # Optional: Run in headless mode (no GUI)
  options.add_argument('--disable-gpu')  # Disable GPU acceleration (useful in headless mode)
  options.add_argument('--no-sandbox')  # Disable sandboxing (helpful in some environments)

  # Configure the ChromeService with the specific chromedriver path
  service = Selenium::WebDriver::Service.chrome(path: chromedriver_path)

  # Create a new Capybara driver using Selenium and the configured options
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
end

Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome
