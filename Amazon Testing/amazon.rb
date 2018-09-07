require 'selenium-webdriver'

class AmazonWebsite
	def setup 
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		@driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"
		@driver.get("https://www.amazon.com/")
		@driver.manage.window.maximize
	end

	def home_page_title(expected_title)
		setup()
		if @driver.title == expected_title
			@driver.quit
			return true
		else
			@driver.quit
			return false
		end
		
	end

	def searching_items
		setup()
		@driver.find_element(:id, "twotabsearchtextbox").send_keys "Books"
		@driver.find_element(:xpath, "/html/body/div[1]/header/div/div[1]/div[3]/div/form/div[2]/div").click
	end
	def title_of_the_page_searched(expected_title)
		searching_items()
		if @driver.title == expected_title
			@driver.quit
			return true
		else
			@driver.quit
			return false
		end
	end

	def selecting_book
		searching_items()
		@driver.execute_script("window.scrollBy(0,300)")
		@driver.find_element(:link, "BEST BOOKS OF THE MONTH").click
	end
	def title_of_the_book_selected_page(expected_title)
		selecting_book()
		if @driver.title == expected_title
			@driver.quit
			return true
		else
			@driver.quit
			return false
		end
	end

	def book_selected_and_adding_to_cart
		selecting_book()
		@driver.find_element(:xpath, "/html/body/div[2]/div[4]/div/div[1]/div/div[1]/div[2]/div/div/div[3]/div[5]/div/div/a").click
	end
	def title_of_the_adding_to_cart_page(expected_title)
		book_selected_and_adding_to_cart()
		if @driver.title == expected_title
			@driver.quit
			return true
		else
			@driver.quit
			return false
		end
	end

	def signin_account
		book_selected_and_adding_to_cart()
		element = @driver.find_element(:xpath, '//*[@id="nav-link-accountList"]')
		@driver.action.move_to(element).perform
		sleep(3)
		@driver.find_element(:xpath, '/html/body/div[2]/header/div/div[1]/div[4]/div[3]/div[2]/div/div[1]/div/a/span').click
	end
	def title_of_the_signin_account_page(expected_title)
		signin_account()
		@driver.title
		if @driver.title == expected_title
			@driver.quit
			return true
		else
			@driver.quit
			return false
		end
	end
end

#sample = AmazonWebsite.new
#sample.title_of_the_adding_to_cart_page("21 Lessons for the 21st Century: Yuval Noah Harari: 9780525512172: Amazon.com: Books")
#sample.signin_account
#sample.title_of_the_signin_account_page("Amazon Sign In")