class Worker

  def initialize
    Capybara.register_driver :selenium do |app|
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.read_timeout = 120 # seconds
      Capybara::Selenium::Driver.new(app, browser: :chrome, http_client: client,
      options: Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox skip-certificate-check]))
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 120 # seconds
      config.default_driver = :selenium
    end
    # Visit
    $browser = Capybara.current_session
    $driver = $browser.driver.browser
  end

  def scrape(url)
    $browser.visit(url)
  end
end
