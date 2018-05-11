require "selenium-webdriver"
 
#Firefox browser instantiation
driver = Selenium::WebDriver.for :firefox
 
#Loading the assertselenium URL
driver.navigate.to "http://www.facebook.com"
 
 
#Quitting the browser
driver.quit