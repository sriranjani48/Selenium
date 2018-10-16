require_relative 'facebook.rb'

browser = FacebookLogin.new("https://www.facebook.com/")

browser.login_username.send_keys "ranjani122@ymail.com"

browser.login_password.send_keys "Hello122"

isLoginLinkDisplayed = browser.submit_button.displayed?
puts isLoginLinkDisplayed

browser.submit_button.click