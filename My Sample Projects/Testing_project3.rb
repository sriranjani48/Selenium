require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.firefox
driver = Selenium::WebDriver.for :remote, desired_capabilities: caps, url: "http://127.0.0.1:4444"

driver.navigate.to("http://toolsqa.com/")

element = driver.find_element(:xpath, '//*[@id="primary-menu"]/li[8]/a/span[1]/span/span')
driver.action.move_to(element).perform

sleep(3)

driver.find_element(:xpath, '/html/body/div[1]/div[1]/header/nav/ul/li[8]/ul/li[3]/a/span[1]/span/span').click

driver.manage.window.maximize
driver.execute_script("window.scrollBy(0,400)")

driver.find_element(:name, "firstname").send_keys "Sri"
driver.find_element(:name, "lastname").send_keys "Ranjini"

driver.find_element(:id, "sex-1").click

driver.find_element(:id, "exp-0").click

driver.execute_script("window.scrollBy(0,400)")

driver.find_element(:id, "datepicker").send_keys "30/8/2018"

driver.find_element(:id, "profession-1").click

driver.find_element(:id, "/html/body/div[1]/div[5]/div[2]/div/div/div[1]/div/div/div/div[2]/div/form/fieldset/div[22]").click


driver.find_element(:id, "tool-2").click

driver.find_element(:name, "continents").find_element(:xpath, "/html/body/div[1]/div[5]/div[2]/div/div/div[1]/div/div/div/div[2]/div/form/fieldset/div[31]/div[1]/select/option[2]").click
sleep(2)

driver.find_element(:name, "selenium_commands").find_element(:xpath, "/html/body/div[1]/div[5]/div[2]/div/div/div[1]/div/div/div/div[2]/div/form/fieldset/div[32]/div/select/option[2]").click
sleep(2)
#driver.find_element(:name, "submit").click