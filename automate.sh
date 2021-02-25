#!/usr/bin/bash



automate(){
	echo "Welcome to Automate" | cowsay
	echo "Creating the directory for your project"
	echo "+------------------------------------------------+"
	mkdir -p $1 && cd $1
	echo "$1" > README.md
	git init &>/dev/null
	git add .&>/dev/null
	git commit -m "first commit" &>/dev/null
	git branch -M main &>/dev/null

	echo "Creating the Repository"
	echo "+------------------------------------------------+"

	curl -i -H "Authorization: token $access_token" -d '{"name": "'"$1"'","auto_init": false,"private": false}'  https://api.github.com/user/repos &>/dev/null
	git remote add origin https://github.com/trevorsaudi/${1}.git &>/dev/null
	git push -u origin main &>/dev/null
	echo "Opening your favourite text editor"
	echo "+------------------------------------------------+"
	code .
	

	exec bash

}
automate $1

