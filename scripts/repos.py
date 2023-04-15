# Description: This script will generate a JSON file containing the first 100
#              repositories of the TypeScript language with a size less than 5 MB.

import requests
import json

language = "typescript"
size = "<5000"  # taille en kilo-octets
url = f"https://api.github.com/search/repositories?q=language:{language}+size:{size}&per_page=100"
headers = {
    "Accept": "application/vnd.github.v3+json"
}
response = requests.get(url, headers=headers)
data = response.json()

repos = [{"name": item["name"], "size": item["size"], "url": item["html_url"],
          "clone_url": item["clone_url"]} for item in data["items"]]

with open("repos.json", "w") as f:
    json.dump(repos, f, indent=2)

print("'repos.json' genreated successfully!")
