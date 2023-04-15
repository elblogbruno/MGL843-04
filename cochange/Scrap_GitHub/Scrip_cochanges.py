#from importlib.metadata import files
#from os import link
from selenium import webdriver
from selenium.webdriver.common.by import By
#from selenium.common.exceptions import NoSuchElementException
import pandas as pd
import time

list_of_links = []
list_of_used_links = []
list_of_cochange_files = []
links = []
files_count = []

file = "types"
repo = "pasUnion/jasonkuhrt/"

data = pd.read_csv(repo + file + ".csv")


browser = webdriver.Chrome()

#print(data)
#ßprint (data["Commit"])
list_of_links = data["Commit"]


#/html/body/div[1]/div[4]/div/main/turbo-frame/div/div/diff-layout/div[2]/div[2]/div[2]/div[1]
def scrip_link (link):
    browser.get(link)
    files_nbr = 0
    list = browser.find_elements(By.CLASS_NAME, "file-header")
    for file in list:
        files_nbr = files_nbr + 1
        print (file.get_attribute('data-path'))
        list_of_used_links.append(link)
        list_of_cochange_files.append(file.get_attribute('data-path'))
    links.append(link)
    files_count.append(files_nbr)


for link in list_of_links:
    print(link)
    time.sleep(1)
    scrip_link(link)

data1 = pd.DataFrame({
    'link' : list_of_used_links,
    'files' : list_of_cochange_files
})
data1.to_csv(repo + file + "_cochanges.csv")
time.sleep(1)

data2 = pd.DataFrame({
    'link' : links,
    'files_count' : files_count
})
data2.to_csv(repo + file + "_cochanges_count.csv")
time.sleep(1)
