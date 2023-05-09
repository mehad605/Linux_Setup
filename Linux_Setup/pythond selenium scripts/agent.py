import os
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
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
# Load the list of video links from the file
with open('video_links.txt', 'r') as f:
    video_links = [line.strip() for line in f.readlines()]

# Go to each video link and add it to the playlist
for video_link in video_links:
    driver.get(video_link)
    time.sleep(5) # Wait for the video to load
    td=driver.find_element(By.ID,'button-shape')
    td.click()
    time.sleep(5) 
    save_button = driver.find_element(By.XPATH, '//yt-formatted-string[text()="Save"]/ancestor::ytd-menu-service-item-renderer')
    save_button.click()
    time.sleep(5) 
    
    
    # Click the "test" playlist
    playlist_button = driver.find_element(By.XPATH, '//yt-formatted-string[text()="testing"]/ancestor::ytd-playlist-add-to-option-renderer')
    playlist_button.click()
    
    time.sleep(3) # Wait for the video to be added to the playlist
    
driver.quit()