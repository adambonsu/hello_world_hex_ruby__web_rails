require "capybara/cucumber"
require "selenium-webdriver"

Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-gpu")
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome
Capybara.app_host = ENV["APP_HOST"] || "http://localhost"
Capybara.server_port = ENV["APP_HOST_PORT"] || 3000
Capybara.default_max_wait_time = 10
