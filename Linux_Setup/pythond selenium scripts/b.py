import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

binary_location = '/usr/bin/brave-browser'
driver_location = './chromedriver'

#service = Service(driver_location)

#object of ChromeOptions class
o = webdriver.ChromeOptions()
o.binary_location= binary_location
#adding Chrome Profile Path
o.add_argument(r"--user-data-dir=/home/maruf/.config/BraveSoftware/Brave-Browser/")
o.add_argument("--profile-directory=Default")
options.add_extension('./extension_1_13_2_0.crx')
#set chromedriver.exe path
driver = webdriver.Chrome(service=service, options=o)
#maximize browser
driver.maximize_window()
#launch URL
driver.get("https://www.tutorialspoint.com/index.htm")
#get browser title
print(driver.title)
#quit browser
