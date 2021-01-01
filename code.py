import os
import requests

access_token = os.getenv('access_token')

headers = {
    'Authorization': f"token {access_token}",
}

data =  '{ "name": "test", "auto_init": true, "private": true, "gitignore_template": "nanoc" }'

response = requests.post('https://api.github.com/user/repos', headers=headers, data=data)
print(response.content)
