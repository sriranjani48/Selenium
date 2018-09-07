require "selenium-webdriver"

caps = Selenium::WebDriver::Remote::Capabilities.firefox
driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444" 

#Opens Google 	
driver.navigate.to("https://www.google.com/")

#Searching for Maple Ridge Library 
driver.find_element(:name, "q").send_keys "Maple Ridge Library"

#Clicking on Google Search Icon
driver.find_element(:xpath, "/html/body/div/div[3]/form/div[2]/div[3]/center/input[1]").click

#Link to Maple Ridge Library Page
driver.find_element(:partial_link_text, "FVRL").click

#a Drop Down Element
driver.find_element(:name, "t").find_element(:css, "option[value = 'title']").click

#a Radio button
driver.find_element(:id, "searchFVRL").click

#a TextField
driver.find_element(:name, "q").send_keys "Jobs"

#Seach/Submit button
driver.find_element(:id, "submit").click

#a dropdown element
driver.find_element(:link_text, "Log In / My FVRL").click

#entering to Login or Register Page
driver.find_element(:link, "Log In / Register").click

driver.find_element(:xpath, '/html/body/div[2]/div[1]/div/div[2]/div[3]/div/nav/ul/li[6]/a').click

sleep(2)

driver.find_element(:link, "News & Magazines").click

driver.find_element(:xpath, "/html/body/div[2]/div[2]/ul/li[1]").click