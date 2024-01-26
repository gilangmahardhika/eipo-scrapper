# Capybara.register_driver :selenium do |app|

# #   options = ::Selenium::WebDriver::Chrome::Options.new
# #   if Rails.env.production?
# #     options.binary = '/usr/bin/google-chrome'
# #   end
# #   Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
# # end
#   client = Selenium::WebDriver::Remote::Http::Default.new

#   # client = Selenium::WebDriver::Chrome::Options.new(args: [
#   # 'no-sandbox', 'disable-setuid-sandbox',
#   # 'disable-dable-dev-shm-usage'])

#   client.read_timeout = 120 # seconds
#   Capybara::Selenium::Driver.new(app, browser: :chrome, http_client: client,
#   options: Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox skip-certificate-check]))
# end
# Capybara.javascript_driver = :chrome
# Capybara.configure do |config|
#   config.default_max_wait_time = 120 # seconds
#   config.default_driver = :selenium
# end
# # Visit
# $browser = Capybara.current_session
# $driver = $browser.driver.browser


# # Capybara.register_driver :chrome do |app|
# #   Capybara::Selenium::Driver.new app, browser: :chrome,
# #     options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu])
# # end

# # Capybara.javascript_driver = :chrome
