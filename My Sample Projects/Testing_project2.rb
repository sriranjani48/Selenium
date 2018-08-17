require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.firefox
driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"

driver.navigate.to "http://adam.goucher.ca/parkcalc/"

driver.find_element(:id, "Lot").find_element(:css, "option[value='EP']").click
sleep(3)
driver.find_element(:name, "EntryTime").clear
sleep(1)
driver.find_element(:name, "EntryTime").send_keys "04.30"
sleep(3)
driver.find_element(:xpath, "/html/body/form/table/tbody/tr[2]/td[2]/font/input[3]" ).click
sleep(3)
#driver.find_element(:xpath, "/html/body/form/table/tbody/tr[2]/td[2]/font/a").click

#driver.find_element(:xpath, "/html/body/form/table/tbody/tr[6]/td[7]")

#driver.find_element(:name, "MonthSelector").find_element(:css, 'option[value=""]').click


driver.find_element(:id, "EntryDate").clear
sleep(1)
driver.find_element(:id, "EntryDate").send_keys "09/20/2018"
sleep(3)
driver.find_element(:id, "ExitTime").clear
sleep(1)
driver.find_element(:id, "ExitTime").send_keys "10.30"
sleep(3)
driver.find_element(:xpath, "/html/body/form/table/tbody/tr[3]/td[2]/font/input[2]").click
sleep(3)
driver.find_element(:name, "ExitDate").clear
sleep(1)
driver.find_element(:name, "ExitDate").send_keys "09/22/2018"
sleep(3)
#driver.submit
driver.find_element(:name, "Submit").click

value = driver.find_element(:xpath, "/html/body/form/table/tbody/tr[4]/td[2]/span/font/b").text
if value == "$ 18.00"
	puts "Test Pass"
else
	puts "No Test"
end