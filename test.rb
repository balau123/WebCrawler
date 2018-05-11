
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
require "selenium-webdriver"
 
#Firefox browser instantiation
driver = Selenium::WebDriver.for :firefox
 
#Loading the assertselenium URL
driver.navigate.to "http://www.facebook.com"
 
 
#Quitting the browser
driver.quit
