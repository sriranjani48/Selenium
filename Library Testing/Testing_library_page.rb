
require "selenium-webdriver"
require "test/unit"


class TestLibraryPage < Test::Unit::TestCase
	def setup
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		@driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"
		@driver.get("https://www.google.com/")	
	end

	def teardown
		@driver.quit
	end

	def test_case1_page_title_should_return_true
		puts "Opening Google from firefox"
		expected_title = "Google"
		assert_equal(@driver.title, expected_title)
		puts "Titles are equal"	
		
	end

	def test_case2_content_search_should_return_true
		puts "Searching for Maple Ridge Library"
		@driver.find_element(:name, "q").send_keys "Maple Ridge Library"
		actual_search = @driver.find_element(:name, "q").attribute("value")
		
		expected_search = "Maple Ridge Library"
		assert_equal(actual_search, expected_search)
		puts "Searching content are equal"	
		#sleep(5)

	end

	def test_case3_opening_library_page_should_return_true
		puts "Opening the Library Homepage"
		@driver.find_element(:name, "q").send_keys "Maple Ridge Library"
		@driver.find_element(:name, "btnK").click
		@driver.find_element(:partial_link_text, "Library").click
		
		expected_title = "Fraser Valley Regional Library"
		assert_equal(@driver.title, expected_title)
		puts "Titles are equal"	
		#sleep(5)

	end
	
	def test_case4_find_catagory_in_library_page
		puts "Searching from Find catagory of Library HomePage"
		@driver.find_element(:name, "q").send_keys "Maple Ridge Library"
		@driver.find_element(:name, "btnK").click
		@driver.find_element(:partial_link_text, "Library").click
		@driver.find_element(:id, "t").find_element(:css, "option[value = 'subject']").click
		@driver.find_element(:id, "searchFVRL").click
		@driver.find_element(:name, "q").send_keys "Ruby"
		@driver.find_element(:id, "submit").click
		
		expected_title = "FVRL \u00BB Site Search"
		assert_equal(@driver.title, expected_title)
		puts "Titles are equal"	
	end

	def test_case5_login_page
		@driver.find_element(:name, "q").send_keys "Maple Ridge Library"
		@driver.find_element(:name, "btnK").click
		@driver.find_element(:partial_link_text, "Library").click
		@driver.find_element(:id, "bibliocommons_user_nav_trigger").click
		@driver.find_element(:link_text, "Log In / Register").click	
		
		expected_title = "Log In | Fraser Valley Regional Library | BiblioCommons"
		assert_equal(@driver.title, expected_title)
	end
end

