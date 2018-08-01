require "selenium-webdriver"

caps = Selenium::WebDriver::Remote::Capabilities.firefox
driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444" 

puts "Opening Google"
#Opens Google 	
driver.navigate.to("https://www.google.com/")

puts "Searching for Maple Ridge Library"
#Searching for Maple Ridge Library 
driver.find_element(:name, "q").send_keys "Maple Ridge Library"

#Clicking on Google Search Icon
driver.find_element(:xpath, "/html/body/div/div[3]/form/div[2]/div[3]/center/input[1]").click

#Link to Maple Ridge Library Page
driver.find_element(:partial_link_text, "FVRL").click

#driver.action.move_to(driver.find_element(:link, "Digital Content")).perform

#driver.action.move_to(driver.find_element(:class, "mega-hover")).perform
puts "Successful search"

puts "Find Books, Movies, Music and More"
#a Drop Down Element
driver.find_element(:id, "t").find_element(:css, "option[value = 'title']").click

#a Radio button
driver.find_element(:id, "searchFVRL").click

#a TextField
driver.find_element(:name, "q").send_keys "Jobs"

#Seach/Submit button
driver.find_element(:id, "submit").click

puts "Found!!"

puts "Loging into My FVRL account"
#a dropdown element
driver.find_element(:link_text, "Log In / My FVRL").click

#entering to Login or Register Page
driver.find_element(:link, "Log In / Register").click
