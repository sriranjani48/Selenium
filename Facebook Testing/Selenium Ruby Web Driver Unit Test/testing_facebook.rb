
require "selenium-webdriver"
require "test/unit"

class TestFacebookpage < Test::Unit::TestCase
	
	def setup
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		@driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"
		@driver.get("https://www.facebook.com/")
	end
	
	def test_facebook_page
		test_titleof_Facebook_LoginPage_Equal("Facebook - Log In or Sign Up")
		test_titleof_Facebook_LoginPage_Not_Equal("Google")
		
		test_titleof_Facebook_LoginPage_afterClicking_loginButton_Equal("Log into Facebook | Facebook")
		test_titleof_Facebook_LoginPage_afterClicking_loginButton_notEqual("Home Page")
		
		test_giving_false_information("Log into Facebook | Facebook")

		test_recover_account_link("Forgot Password | Can't Log In | Facebook")

		test_recover_account("Forgot Password | Can't Log In | Facebook")

		test_opening_signup_page("Sign Up for Facebook | Facebook")
	end

	def test_titleof_Facebook_LoginPage_Equal(expected_title)
		#assert(@driver.page_source.include?("facebook"),"Assertion Failed")
		assert_equal(@driver.title, expected_title)
	end
	def test_titleof_Facebook_LoginPage_Not_Equal(expected_title)
		assert_not_equal(@driver.title, expected_title)
	end
	
	def test_titleof_Facebook_LoginPage_afterClicking_loginButton_Equal(expected_title)		
		if @driver.find_element(:id => "loginbutton").displayed?
			@driver.find_element(:id, "loginbutton").click
			puts "No Username and Password are entered"
			assert_equal(@driver.title, expected_title)
		end
	end
	def test_titleof_Facebook_LoginPage_afterClicking_loginButton_notEqual(expected_title)		
		assert_not_equal(@driver.title, expected_title)
	end

	def test_giving_false_information(expected_title)
		puts "Entering Username and password: "

		arr = Array.new
		fileline = File.open("selenium.txt", "r+") 
		fileline.each do |line|
			arr.push(line)
		end

		@driver.find_element(:id, "email").send_keys "#{arr[0]}"
		@driver.find_element(:id, "pass").send_keys "#{arr[1]}"
		@driver.find_element(:id, "loginbutton").click

		assert_equal(@driver.title, expected_title)
		
		puts "Failure in Logging In: Incorrect UserName and Password"
		puts "Recover your Account Or SignUp"
	end

	def test_recover_account_link(expected_title)
		if @driver.find_element(:link, "Recover Your Account").displayed?
			@driver.find_element(:link, "Recover Your Account").click
			assert_equal(@driver.title, expected_title)
		end
	end

	def test_recover_account(expected_title)
		if @driver.find_element(:id, "did_submit").displayed?
			@driver.find_element(:id, "did_submit").click	
			assert_equal(@driver.title, expected_title)	
		end
		puts "Recovering account Failed"
	end
		
	def test_opening_signup_page(expected_title)
		if @driver.find_element(:class, "uiButtonText").displayed?
			@driver.find_element(:class, "uiButtonText").click
		end
		
		if @driver.find_element(:link_text, "Create New Account").displayed?
			@driver.find_element(:link_text, "Create New Account").click
			assert_equal(@driver.title, expected_title)
		end
		puts "Sign up for Facebook"
	end
end
	 
		
