import os
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

binary_location = '/usr/bin/brave-browser'
driver_location = './chromedriver'
service = Service(driver_location)

chrome_options = webdriver.ChromeOptions()
chrome_options.binary_location = binary_location
chrome_options.add_argument("--headless")
chrome_options.add_argument(r"--user-data-dir=/home/maruf/.config/BraveSoftware/Brave-Browser/")
chrome_options.add_argument("--profile-directory=Default")
driver = webdriver.Chrome(service=service,options=chrome_options)


driver.get("https://www.youtube.com/@CajunKoiAcademy/videos")

# Scroll down until the end of the page is reached
last_height = driver.execute_script("return document.documentElement.scrollHeight")

while True:
    driver.execute_script("window.scrollTo(0, document.documentElement.scrollHeight);")
    time.sleep(2)
    new_height = driver.execute_script("return document.documentElement.scrollHeight")
    if new_height == last_height:
        break
    last_height = new_height

video_element = driver.find_elements(By.ID, 'video-title')

#from oldest to newest
video_element.reverse()

with open('video_title.txt', 'w') as f:
    for i in range(len(video_element)):
                f.write(f"{video_element[i].text}\n")