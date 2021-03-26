require 'appium_lib'

options = {
  caps: {
    :platformName => 'iOS',
    :platformVersion => '14.0.1',
    :deviceName => 'iPhone',
    :automationName => 'XCUITest',
    :wdaLocalPort => '5555',
    :udid => 'todo',
    :bundleId => 'com.apple.Preferences',
    :noReset => true,
    :waitForQuiescence => false
  },
  appium_lib: {
    server_url: "http://localhost:4723/wd/hub"
  }
}

driver = Appium::Driver.new(options, true)

begin
  driver.start_driver
  driver.set_wait(0.5)
  sleep(5)
  puts driver.get_source
ensure
  driver.quit_driver
end
