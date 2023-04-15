#from importlib.metadata import files
#from os import link
from selenium import webdriver
from selenium.webdriver.common.by import By
#from selenium.common.exceptions import NoSuchElementException
import pandas as pd
import time
#from random import randint


browser = webdriver.Chrome()

#link = "https://github.com/Chuzzy/Emojiopoly/commits/master/src/monopoly/MonopolyGame.ts"
#link = "https://github.com/reduxjs/reselect/commits/master/src/defaultMemoize.ts"
#link = "https://github.com/reduxjs/reselect/commits/master/typescript_test/test.ts"
#link = "https://github.com/reduxjs/reselect/commits/master/src/index.ts"

#link = "https://github.com/aurelia/framework/commits/master/src/framework-configuration.ts"
#link = "https://github.com/aurelia/framework/commits/master/dist/types/aurelia-framework.d.ts"
#link = "https://github.com/aurelia/framework/commits/master/src/aurelia.ts"

#link = "https://github.com/mobxjs/mobx-react/commits/master/src/disposeOnUnmount.ts"
#link = "https://github.com/mobxjs/mobx-react/commits/master/src/propTypes.ts"
#link = "https://github.com/mobxjs/mobx-react/commits/master/src/observerClass.ts"
#link = "https://github.com/mobxjs/mobx-react/commits/master/src/utils/utils.ts"

#link = "https://github.com/pop-os/shell/commits/master_jammy/src/window.ts"
#link = "https://github.com/pop-os/shell/commits/master_jammy/src/panel_settings.ts"
#link = "https://github.com/pop-os/shell/commits/master_jammy/src/events.ts"
#link = "https://github.com/pop-os/shell/commits/master_jammy/src/extension.ts"

#link = "https://github.com/jasonkuhrt/graphql-request/commits/main/src/index.ts"
#link = "https://github.com/jasonkuhrt/graphql-request/commits/main/src/defaultMemoize.ts"
#link = "https://github.com/jasonkuhrt/graphql-request/commits/main/typescript_test/test.ts",
#link = "https://github.com/jasonkuhrt/graphql-request/commits/main/src/defaultMemoize.ts"


#link = "https://github.com/NarrativeScience-old/log.io/commits/master/server/src/index.ts"
#link = "https://github.com/NarrativeScience-old/log.io/commits/master/server/src/iputs.ts"
#link = "https://github.com/NarrativeScience-old/log.io/commits/master/server/src/server.ts"
#link = "https://github.com/NarrativeScience-old/log.io/commits/master/server/src/types.ts"

#link = "https://github.com/googleworkspace/md2googleslides/commits/main/src/auth.ts"
#link = "https://github.com/googleworkspace/md2googleslides/commits/main/src/slide_generator.ts"
#link = "https://github.com/googleworkspace/md2googleslides/commits/main/src/slides.ts"
#link = "https://github.com/googleworkspace/md2googleslides/commits/main/src/utils.ts"

repo = "pasUnion/diegohaz/"
file = "rollup"
#link = "https://github.com/diegohaz/constate/commits/master/babel.config.js"
#link = "https://github.com/diegohaz/constate/commits/master/jest.config.js"
link = "https://github.com/diegohaz/constate/commits/master/rollup.config.js"



browser.get(link) # ouvre le lien de l'historique du fichier dans GitHub
time.sleep(5)

cont_count = 0
commit_count = 0
list_of_links = []
list_of_filttred_commits = []
list_of_count = []
"""""
list_of_commits = browser.find_elements(By.XPATH,'/html/body/div[1]/div[4]/div/main/turbo-frame/div/div/div[2]/div[1]/div[2]/ol/li[2]/div[2]/div[1]/a').get_attribute('href')
for commit in list_of_commits:
    commit_count = commit_count + 1
    print(commit_count)
    print(commit.value)
#//*[@id="repo-content-pjax-container"]/div/div[2]
#//*[@id="repo-content-pjax-container"]/div/div[2]
#//*[@id="repo-content-pjax-container"]/div/div[2]/div[1]/div[2]/ol/li[1]/div[2]/div[1]/a
#/html/body/div[1]/div[4]/div/main/turbo-frame/div/div/div[2]/div[1]/div[2]/ol/li[2]/div[2]/div[1]/a
#/html/body/div[1]/div[4]/div/main/turbo-frame/div/div/div[2]/div[1]/div[2]/ol/li[1]/div[2]/div[1]/a
#/html/body/div[1]/div[4]/div/main/turbo-frame/div/div/div[2]/div[2]/div[2]/ol/li/div[2]/div[1]/a
"""""
list_of_containers = browser.find_elements(By.CLASS_NAME, "TimelineItem-body")
#print(len(list_of_containers))

for container in list_of_containers:
    cont_count = cont_count + 1
    print(cont_count)
    list_of_commits = container.find_elements(By.TAG_NAME, "a")
    for commit in list_of_commits:
        #print(commit.get_attribute('href'))
        if '/commit/' in commit.get_attribute('href'):
            if (commit_count % 2) == 0:
                #print(commit_count)
                #print(commit.get_attribute('href'))
                list_of_filttred_commits.append(commit.get_attribute('href'))
                list_of_count.append(cont_count)
            commit_count = commit_count + 1

data = pd.DataFrame({
    'ContNb' : list_of_count,
    'Commit' : list_of_filttred_commits
})

data.to_csv(repo + file + ".csv")
time.sleep(1)
#"""

print("___________________________________")