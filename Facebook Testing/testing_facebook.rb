
require "selenium-webdriver"
require "test/unit"

class TestFacebookpage < Test::Unit::TestCase
	def setup
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		@driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"
		@driver.get("https://www.facebook.com/")
	end
	
	def test_loginpage

		#assert(@driver.page_source.include?("facebook"),"Assertion Failed")
		assert_equal(@driver.title, "Facebook - Log In or Sign Up")
		assert_not_equal(@driver.title, "Hello_world")


		assert_equal(true, @driver.find_element(:id => "email").displayed?)
		assert_not_equal(false, @driver.find_element(:id => "email").displayed?)
		

		assert_equal(true, @driver.find_element(:id => "pass").displayed?)
		assert_not_equal(false, @driver.find_element(:id => "pass").displayed?)


		assert_equal(true, @driver.find_element(:id => "loginbutton").displayed?)
		assert_not_equal(false, @driver.find_element(:id => "loginbutton").displayed?)


		assert_equal(true, @driver.find_element(:link => "Forgot account?").displayed?)
		assert_not_equal(false, @driver.find_element(:link => "Forgot account?").displayed?)



		arr = Array.new
		fileline = File.open("selenium.txt", "r+") 
		fileline.each do |line|
			arr.push(line)
		end

		@driver.find_element(:id, "email").send_keys "#{arr[0]}"
		username = @driver.find_element(:id, "email").attribute("value")
		
		expected_username = "ranjanisri@ymail.com"
		assert_equal(username,expected_username)

		expected_username = "abcd@ymail.com"
		assert_not_equal(username,expected_username)


		@driver.find_element(:id, "pass").send_keys "#{arr[1]}"
		password = @driver.find_element(:id, "pass").attribute("value")

		expected_password = "1234Test"
		assert_equal(password,expected_password)
		
		expected_password = "qwerty"
		assert_not_equal(password,expected_password)
		
		#@driver.find_element(:id, "loginbutton").click
		#@driver.find_element(:id, "userNavigationLabel").click
		#@driver.find_element(:link, "Log Out").click
		
		@driver.quit
	end
end
