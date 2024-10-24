require "capybara/cucumber"
require "selenium-webdriver"

Capybara.default_driver = :selenium_chrome
Capybara.app_host = ENV["APP_HOST"] || "http://localhost"
Capybara.server_port = ENV["APP_HOST_PORT"] || 3000
Capybara.default_max_wait_time = 10
