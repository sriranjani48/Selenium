require "selenium-webdriver"


caps = Selenium::WebDriver::Remote::Capabilities.firefox
driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"
driver.get("https://www.ia.ca/")

driver.find_element(:link, "LOANS").click
driver.find_element(:link, "Mortgages").click

driver.manage.window.maximize
driver.execute_script("window.scrollBy(0,1000)")

driver.find_element(:xpath, "/html/body/div[2]/main/div/div/section[4]/div/div/div/div[2]/div/div/a[2]/div/h3").click

driver.execute_script("window.scrollTo(0,200)")
driver.find_element(:id, "PrixProprietePlus").click
driver.find_element(:id, "PrixProprietePlus").click
#OR
#for i in 0..1
#driver.find_element(:id, "PrixProprietePlus").click
#end

driver.execute_script("window.scrollBy(0,400)")
for i in 0..2
	driver.find_element(:id, "MiseDeFondPlus").click
end

driver.execute_script("window.scrollBy(0,700)")
driver.find_element(:class, "button").click
driver.find_element(:xpath, "/html/body/main/div[2]/div[8]/div/div[1]/div[1]/form/div[4]/div[1]/div/div[3]/div/ul/li[1]").click


element = driver.find_element(:xpath, "/html/body/main/div[2]/div[8]/div/div[1]/div[1]/form/div[5]/div[2]/span").click
#driver.action.move_to(element)
#driver.find_element(:class, "label").click
driver.find_element(:xpath, "/html/body/main/div[2]/div[8]/div/div[1]/div[1]/form/div[5]/div[3]/div/ul/li[4]").click

driver.find_element(:name, "TauxInteret").clear

driver.find_element(:name, "TauxInteret").send_keys "5"

driver.find_element(:class, "btn-trouver").click

actual_result = driver.find_element(:xpath, '//*[@id="paiement-resultats"]').text
if actual_result == "$ 363.17"
	puts "Text"
else
	puts "No Text"
end


