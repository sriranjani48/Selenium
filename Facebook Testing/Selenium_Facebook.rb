require "selenium-webdriver"

caps = Selenium::WebDriver::Remote::Capabilities.firefox
driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"

driver.get("https://www.facebook.com/")

arr = Array.new
fileline = File.open("selenium.txt", "r+") 
fileline.each do |line|
arr.push(line)
end

driver.find_element(:id, "email").send_keys "#{arr[0]}"
driver.find_element(:id, "pass").send_keys "#{arr[1]}"
driver.find_element(:id, "loginbutton").click

	
driver.find_element(:link, "Recover Your Account").click		

driver.find_element(:id, "identify_email").send_keys "ranjanisri@ymail.com"		
driver.find_element(:id, "did_submit").click

driver.find_element(:class, "uiButtonText").click

driver.find_element(:link, "Create New Account").click

