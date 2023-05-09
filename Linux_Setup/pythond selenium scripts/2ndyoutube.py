import os
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver import ActionChains

binary_location = '/usr/bin/brave-browser'
driver_location = './chromedriver'
service = Service(driver_location)

chrome_options = webdriver.ChromeOptions()
chrome_options.binary_location = binary_location
chrome_options.add_argument(r"--user-data-dir=/home/maruf/.config/BraveSoftware/Brave-Browser/")
chrome_options.add_argument("--profile-directory=Default")
driver = webdriver.Chrome(service=service,options=chrome_options)


driver.get("https://www.youtube.com/@CajunKoiAcademy/videos")
# Locate the element to hover over
hover_element = wait.until(EC.visibility_of_element_located((By.ID, 'contents')))
wait = WebDriverWait(driver, 10)
# Use ActionChains to hover over the element
actions = ActionChains(driver)
actions.move_to_element(hover_element).perform()

video_element = driver.find_elements(By.ID, 'contents')
video_element.find_element(By.ID,'button').click()