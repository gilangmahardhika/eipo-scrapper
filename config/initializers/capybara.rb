Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
  #options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu]))
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end
# Visit
$browser = Capybara.current_session
$driver = $browser.driver.browser


# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new app, browser: :chrome,
#     options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu])
# end

# Capybara.javascript_driver = :chrome
