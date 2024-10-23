require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = "http://localhost:3000"
Capybara.default_max_wait_time = 10