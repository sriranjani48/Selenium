
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

		login = @driver.find_element(:id, "loginbutton").click
		puts "No Username and Password are entered"


		puts "Entering Username and password: "

		arr = Array.new
		fileline = File.open("selenium.txt", "r+") 
		fileline.each do |line|
			arr.push(line)
		end

		@driver.find_element(:id, "email").send_keys "#{arr[0]}"
		username = @driver.find_element(:id, "email").attribute("value")
		
		@driver.find_element(:id, "pass").send_keys "#{arr[1]}"
		password = @driver.find_element(:id, "pass").attribute("value")
		
		login = @driver.find_element(:id, "loginbutton")
		login.submit


		expected_username = "abcdefg"
		assert_not_equal(username,expected_username)

		expected_password = "000999"
		assert_not_equal(password,expected_password)

		puts "Failure in Logging In: Incorrect UserName and Password"

		puts "Re-enetr Username and Password Or SignUp"

		expected_username = "ranjanisri@ymail.com"
		expected_password = "1234Test"
		assert_equal(username,expected_username)
		assert_equal(password,expected_password)

		login = @driver.find_element(:id, "loginbutton").click
		puts "No such Account exists"
		puts "Recover your Account Or SignUp"

		assert_equal(true, @driver.find_element(:link, "Recover Your Account").displayed?)
		@driver.find_element(:link, "Recover Your Account").click
		
		assert_equal(@driver.title, "Forgot Password | Can't Log In | Facebook")
		
		puts "Recovering My Account...."
		
		assert_equal(true, @driver.find_element(:id, "did_submit").displayed?)
		@driver.find_element(:id, "did_submit").click
		
		
		puts "Please fill in the field"
		
		search = @driver.find_element(:id, "identify_email")
		@driver.action.click(search).perform
		
		@driver.find_element(:id, "identify_email").send_keys "ranjanisri@ymail.com"
		
		@driver.find_element(:id, "did_submit").click
		puts "No Search Results. Please try again with other information."

		#@driver.find_element(:id, "userNavigationLabel").click
		#@driver.find_element(:link, "Log Out").click
		
		#@driver.quit
	end
end
