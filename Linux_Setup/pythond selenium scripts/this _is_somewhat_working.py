import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

binary_location = '/usr/bin/brave-browser'
driver_location = './chromedriver'
service = Service(driver_location)

# Set up the Chrome driver in headless mode
chrome_options = webdriver.ChromeOptions()
chrome_options.binary_location = binary_location
chrome_options.add_argument("--headless")
driver = webdriver.Chrome(service=service,options=chrome_options)
#################
categories = ['politics', 'sports', 'entertainment', 'economy', 'world news']

prothom_alo=['https://www.prothomalo.com/politics',
             'https://www.prothomalo.com/sports',
             'https://www.prothomalo.com/entertainment',
             'https://www.prothomalo.com/business',
             'https://www.prothomalo.com/world']

print('Please select a category:')
for i, category in enumerate(categories):
    print(f'{i+1}. {category}')

choice = input('Enter the number corresponding to the category: ')

try:
    choice = int(choice)
    if choice < 1 or choice > len(categories):
        raise ValueError
except ValueError:
    print('Invalid choice.')
    exit(1)

####################
# Navigate to the website
driver.get(prothom_alo[choice-1])

# Get the text content of the post titles
elements = driver.find_elements(By.CLASS_NAME, 'card-with-image-zoom')[:5]
article_data = [{'title': element.get_attribute('aria-label'), 'link': element.get_attribute('href')} for element in elements]


# Write the article titles and links to a file
with open("article_data.txt", "w") as file:
    for data in article_data:
                file.write(f"{data['title']}\n{data['link']}\n")


driver.close()