import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

# Specify the location of the Brave browser binary
binary_location = '/usr/bin/brave-browser'

# Specify the location of the Chrome driver
driver_location = '/home/chromedriver'

# Create a Service object for the Chrome driver
service = Service(driver_location)

# Set the options for the Brave browser
options = webdriver.ChromeOptions()
options.binary_location = binary_location

options.add_extension('./extension_1_13_2_0.crx')
#options.add_argument('--no-sandbox')

# Use the existing Brave profile
#profile_path = '~/.config/BraveSoftware/Brave-Browser/test'
#options.add_argument(f'user-data-dir={profile_path}') 
#/home/maruf/.config/BraveSoftware/Brave-Browser/Default
# Start the Brave browser
driver = webdriver.Chrome(service=service, options=options)

# Go to Facebook
driver.get('https://www.facebook.com')

# Wait for 3 minutes
time.sleep(180)

# Close the browser
driver.quit()
