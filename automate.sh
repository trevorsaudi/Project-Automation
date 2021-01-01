#!/usr/bin/bash

repo_name=$1

makecd(){
  mkdir -p $repo_name && cd $repo_name
  echo "$repo_name" > README.md
  git init
  git add .
  git commit -m "first commit"
  git branch -M main
  curl -i -H "Authorization: token $access_token" -d '{"name": "'"$repo_name"'","auto_init": false,"private": true}'  https://api.github.com/user/repos
  git remote add origin https://github.com/trevorsaudi/${repo_name}.git
  git push -u origin main
  code .
  exec bash

}
makecd $repo_name

