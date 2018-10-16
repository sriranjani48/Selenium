require "selenium-webdriver"
class FacebookLogin
	def initialize(url)
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		@driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"
		@driver.get(url)
	end
	def login_username
		return @driver.find_element(:id, "email")
	end

	def login_password
		return @driver.find_element(:id, "pass")
	end

	def submit_button
		return @driver.find_element(:id, "loginbutton")
	end
end



