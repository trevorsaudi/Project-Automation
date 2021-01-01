#!/usr/bin/bash

mkcd(){

	mkdir -p $1 && cd $1 

}


gitinitalize(){
	git init
	echo "# $1" >> README.md
	git add .
	git commit -m "intial commit"
	git branch -M main
	git remote add origin https://github.com/trevorsaudi/$1.git
	git push -u origin main
	exec bash
}
mkcd $1
gitinitalize $1
exec()
