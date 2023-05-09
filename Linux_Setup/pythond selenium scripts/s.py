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
# chrome_options.add_argument("--headless")
chrome_options.add_argument(r"--user-data-dir=/home/maruf/.config/BraveSoftware/Brave-Browser/")
chrome_options.add_argument("--profile-directory=Default")
driver = webdriver.Chrome(service=service,options=chrome_options)

# Define the path of the file containing the YouTube video links
file_path = "video_links.txt"

# Define the URL of the YouTube playlist where the videos will be added
playlist_url = "https://www.youtube.com/playlist?list=PLRfcOmZVUSL23rYAE_KMWRwZDhXmcSvJj"

# Navigate to the YouTube playlist URL
driver.get(playlist_url)

# Wait for the playlist to load
time.sleep(5)

# Open the file containing the YouTube video links
with open(file_path, "r") as f:
    video_links = f.readlines()

# Loop through each video link
for link in video_links:
    # Navigate to the YouTube video page
    driver.get(link)
    time.sleep(5)
    
    # Click the "Add to" button
    add_button = driver.find_element_by_xpath("//div[@class='style-scope ytd-menu-renderer']//paper-item[@id='action-panel-add-to-playlist']//yt-formatted-string")
    add_button.click()
    
    # Wait for the add to playlist dialog to load
    time.sleep(5)
    
    # Select the "test" playlist
    playlist_input = driver.find_element_by_xpath("//div[@class='style-scope ytd-add-to-playlist-renderer']//input[@name='playlistName']")
    playlist_input.send_keys("test")
    playlist_input.send_keys(Keys.RETURN)
    
    # Wait for the video to be added to the playlist
    time.sleep(5)

# Close the Chrome webdriver instance
driver.quit()

# Return the response as a string
response = "All the YouTube videos have been added to the 'test' playlist"
print(response)