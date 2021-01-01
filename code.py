import os
# import requests
import sys
import subprocess

access_token = os.getenv('access_token')

headers = {
    'Authorization': f"token {access_token}",
}


repo_name = sys.argv[1]
cwd = os.getcwd()
os.mkdir(repo_name)
os.chdir(cwd + '/' + repo_name)

data =  '{ "name": "%s", "auto_init": true, "private": true, "gitignore_template": "nanoc" }' %(repo_name)
response = requests.post('https://api.github.com/user/repos', headers=headers, data=data)
